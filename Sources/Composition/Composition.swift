import Foundation
import Datable

#if os(Linux)
import NetworkLinux
#else
import Network
#endif

public func remoteCall(code: String, callback: @escaping (Data) -> Void )
{
    let queue = DispatchQueue(label: "network")
    
    let conn = NWConnection(host: NWEndpoint.Host("127.0.0.1"), port: NWEndpoint.Port(integerLiteral: 1234), using: .tcp)
    conn.start(queue: queue)

    let payload = code.data
    let length = payload.count
    let length16 = UInt16(length)
    let lengthBytes = length16.data
    let data = lengthBytes + payload
    
    conn.send(content: data, completion: NWConnection.SendCompletion.contentProcessed(
    {
        maybeError in
        
        guard maybeError == nil else { return }
        
        conn.receive(minimumIncompleteLength: 2, maximumLength: 2)
        {
            (maybeData, maybeContext, isComplete, maybeError) in
            
            if let data = maybeData
            {
                print("composition received \(data)")
            }
           
            guard maybeError == nil else { return }
            guard let data = maybeData else { return }
            
            let length = Int(data.uint16)
            
            conn.receive(minimumIncompleteLength: length, maximumLength: length)
            {
                (maybeData, maybeContext, isComplete, maybeError) in
                
                if let data = maybeData
                {
                    print("received.. \(data)")
                }
                
                guard maybeError == nil else { return }
                guard let data = maybeData else { return }
                
                callback(data)
            }
        }
    }))
}
