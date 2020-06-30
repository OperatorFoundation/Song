import Foundation
import AST
import Parser
import Source
import Network
import Datable
import Package

func main()
{
    let queue = DispatchQueue(label: "network")
    
    guard let listener = try? NWListener(using: .tcp, on: NWEndpoint.Port(integerLiteral: 1234)) else { return }
    listener.newConnectionHandler =
    {
        conn in
        
        print(conn)
        conn.start(queue: queue)
        
        conn.receive(minimumIncompleteLength: 2, maximumLength: 2)
        {
            (maybeData, maybeContext, isComplete, maybeError) in
            
            print("received \(maybeData)")
            
            guard maybeError == nil else { return }
            guard let data = maybeData else { return }
            
            let length = Int(data.uint16!)
            
            conn.receive(minimumIncompleteLength: length, maximumLength: length)
            {
                (maybeData, maybeContext, isComplete, maybeError) in
                
                print("received.. \(maybeData)")
                
                guard maybeError == nil else { return }
                guard let data = maybeData else { return }
                
                let source = "import Song\n".data + data + "\n\nlet song = SongEncoder()\nlet output = try? song.encode(result)\nprint(output.string)\n".data
                
                let package = Package(name: "query", type: .executable)
                package.update()
                
                let destination = URL(fileURLWithPath: "query/Sources/query/main.swift")
                guard let _ = try? source.write(to: destination) else { return }
                
                package.build()
                let result = package.run()
                print("Success!")
                print(result)
                
                let resultLength = result.count
                let resultLength16 = UInt16(resultLength)
                let resultLengthBytes = resultLength16.data
                
                let payload = resultLengthBytes + result
                conn.send(content: payload, contentContext: NWConnection.ContentContext.defaultMessage, isComplete: true, completion: NWConnection.SendCompletion.idempotent)
            }
        }
    }
    listener.start(queue: queue)
}

main()

let _ = readLine()
