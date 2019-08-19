import Foundation
import AST
import Parser
import Source

func replaceClass(source: TopLevelDeclaration, index: Int, cd: ClassDeclaration) -> TopLevelDeclaration
{
    var cls = cd
    var result = source
    for (mindex, member) in cd.members.enumerated()
    {
        switch member
        {
            case .declaration(let declaration):
                switch "\(type(of: declaration))"
                {
                    case "FunctionDeclaration":
                        print("Replacing \(mindex) \(result)")
                        let fd = declaration as! FunctionDeclaration
                        cls = replaceFunction(source: cls, index: mindex, fd: fd)
                        var statements = result.statements
                        statements[index] = cls
                        result = TopLevelDeclaration(statements: statements, comments: result.comments, shebang: result.shebang)
                        print("Replaced \(mindex) \(result)")
                    default:
                        continue
                }
            default:
                continue
        }
    }
    return result
}

func replaceFunction(source: ClassDeclaration, index: Int, fd: FunctionDeclaration) -> ClassDeclaration
{
    let newFd = replaceBody(source: fd)
    var members = source.members
    let member = ClassDeclaration.Member.declaration(newFd)
    members[index] = member
    let result = ClassDeclaration(attributes: source.attributes, accessLevelModifier: source.accessLevelModifier, isFinal: source.isFinal, name: source.name, genericParameterClause: source.genericParameterClause, typeInheritanceClause: source.typeInheritanceClause, genericWhereClause: source.genericWhereClause, members: members)
    return result
}

func replaceBody(source: FunctionDeclaration) -> FunctionDeclaration
{
    print("replaceBody:")
    let fc = makeFunctionCall(source: source)
    let fcs = "\(fc)"
    print("fcs: \(fcs)")
    
    var statements: [Statement] = [
        ConstantDeclaration(attributes: [], modifiers: [], initializerList: [
            PatternInitializer(pattern: IdentifierPattern(identifier: Identifier.name("code")), initializerExpression: LiteralExpression(kind: LiteralExpression.Kind.interpolatedString([], "\"\(fcs)\""))
            )
        ]),
    ]
    
    if let fr = source.signature.result
    {
        print("fr: \(fr)")
        statements.append(
            ConstantDeclaration(attributes: [], modifiers: [], initializerList: [
                PatternInitializer(pattern: IdentifierPattern(identifier: Identifier.name("resultString")), initializerExpression: FunctionCallExpression(
                        postfixExpression: IdentifierExpression(kind: .identifier(Identifier.name("remoteCall"), nil)),
                        argumentClause: [
                            .expression(IdentifierExpression(kind: .identifier(Identifier.name("code"), nil)))
                        ]
                    )
                )
            ])
        )

        statements.append(
            ConstantDeclaration(attributes: [], modifiers: [], initializerList: [
                PatternInitializer(pattern: IdentifierPattern(identifier: Identifier.name("song")), initializerExpression: FunctionCallExpression(
                        postfixExpression: IdentifierExpression(kind: .identifier(Identifier.name("SongDecoder"), nil)),
                        argumentClause: [
                        ]
                    )
                )
            ])
        )
        
        statements.append(
            ConstantDeclaration(attributes: [], modifiers: [], initializerList: [
                PatternInitializer(pattern: IdentifierPattern(identifier: Identifier.name("result")), initializerExpression:
                    TryOperatorExpression(kind: .optional(
                        FunctionCallExpression(
                            postfixExpression: ExplicitMemberExpression(
                                kind: .namedType(
                                    IdentifierExpression(kind: .identifier(Identifier.name("song"), nil)),
                                    Identifier.name("decode")
                                )
                            ),
                            argumentClause: [
                                .expression(
                                    ExplicitMemberExpression(kind: .namedType(
                                        IdentifierExpression(kind: .identifier(Identifier.name(fr.type.description), nil)),
                                        Identifier.name("self")
                                    ))
                                ),
                                .namedExpression(
                                    Identifier.name("from"),
                                    IdentifierExpression(kind: .identifier(Identifier.name("resultString"), nil))
                                )
                            ]
                        )
                    ))
                )
            ])
        )
        
        statements.append(
            ReturnStatement(expression: IdentifierExpression(kind: .identifier(Identifier.name("result"), nil)))
        )
    }
    else
    {
        print("no fr")
        statements.append(
            ConstantDeclaration(attributes: [], modifiers: [], initializerList: [
                PatternInitializer(pattern: IdentifierPattern(identifier: Identifier.name("_")), initializerExpression: FunctionCallExpression(
                        postfixExpression: IdentifierExpression(kind: .identifier(Identifier.name("remoteCall"), nil)),
                        argumentClause: [
                            .expression(IdentifierExpression(kind: .identifier(Identifier.name("code"), nil)))
                        ]
                    )
                )
            ])
        )
    }
        
    let newBody: CodeBlock? = CodeBlock(statements: statements)
    let result = FunctionDeclaration(attributes: source.attributes, modifiers: source.modifiers, name: source.name, genericParameterClause: source.genericParameterClause, signature: source.signature, genericWhereClause: source.genericWhereClause, body: newBody)
    print("replaceBody: \(result)")
    return result
}

func makeFunctionCall(source: FunctionDeclaration) -> ConstantDeclaration
{
    if source.signature.result == nil
    {
        return ConstantDeclaration(attributes: [], modifiers: [], initializerList: [
            PatternInitializer(pattern: IdentifierPattern(identifier: Identifier.name("_")), initializerExpression: FunctionCallExpression(postfixExpression: IdentifierExpression(kind: IdentifierExpression.Kind.identifier(source.name, nil)), argumentClause: []))
            ])
    }
    else
    {
        return ConstantDeclaration(attributes: [], modifiers: [], initializerList: [
            PatternInitializer(pattern: IdentifierPattern(identifier: Identifier.name("result")), initializerExpression: FunctionCallExpression(postfixExpression: IdentifierExpression(kind: IdentifierExpression.Kind.identifier(source.name, nil)), argumentClause: []))
            ])
    }
}

func parseTest()
{
    let path = FileManager.default.currentDirectoryPath
    print(path)
    
    let filePath = "/Users/brandon/test.swift"
    guard let sourceFile = try? SourceReader.read(at: filePath) else { return }

    let parser = Parser(source: sourceFile)
    if let topLevelDecl = try? parser.parse()
    {
        var result = topLevelDecl
        
        for (index, statement) in topLevelDecl.statements.enumerated()
        {
            switch "\(type(of: statement))"
            {
                case "StructDeclaration":
                    print("struct!")
                    let sd = statement as! StructDeclaration
                    print(sd.name)
                case "ClassDeclaration":
                    print("class!")
                    let cd = statement as! ClassDeclaration
                    result = replaceClass(source: result, index: index, cd: cd)
                    print(">>>\(result)<<<")
                default:
                    print("Unknown statement: \(statement)")
                    continue
            }
        }
        
        print(result)
    }
}

parseTest()
