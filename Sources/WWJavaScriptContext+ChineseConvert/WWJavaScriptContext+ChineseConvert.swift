import UIKit
import JavaScriptCore
import WWJavaScriptContext

// MARK: - WWJavaScriptContext.ChineseConvert
extension WWJavaScriptContext {
    
    open class ChineseConvert: NSObject {
        
        public enum ConvertType {
            case cn                                     // 轉成簡體中文
            case tw                                     // 轉成正體中文
        }
        
        /// js函數名稱類型
        enum FunctionNameType {
            
            case simplifiedChinese(_ source: String)    // 轉成簡體中文js函數名稱
            case traditionalChinese(_ source: String)   // 轉成正體中文js函數名稱
            
            /// js函數名稱
            /// - Returns: String
            func name() -> String {
                switch self {
                case .simplifiedChinese(_): return "simplifiedChinese"
                case .traditionalChinese(_): return "traditionalChinese"
                }
            }
        }
        
        public static let shared = ChineseConvert(filename: "OpenCC-JS-1.0.5.js")
        
        var context: WWJavaScriptContext?
        
        private override init() {}
        
        convenience init(filename: String) {
            self.init()
            self.context = self.build(with: filename)
        }
    }
}

// MARK: - 公開函數
public extension WWJavaScriptContext.ChineseConvert {
    
    /// [繁體 <=> 簡體](https://cdn.jsdelivr.net/npm/opencc-js@1.0.5/dist/umd/full.js)
    /// - Parameters:
    ///   - text: [String?](https://github.com/nk2028/opencc-js)
    ///   - type: ConvertType
    /// - Returns: String?
    func convert(text: String?, to type: ConvertType = .cn) -> String? {
        
        guard let text = text else { return nil }

        switch type {
        case .tw: return convertSource(with: .traditionalChinese(text))?.toString()
        case .cn: return convertSource(with: .simplifiedChinese(text))?.toString()
        }
    }
}

// MARK: - 小工具
private extension WWJavaScriptContext.ChineseConvert {
    
    /// 建立初始物件
    /// - Returns: WWJavaScriptContext?
    func build(with path: String) -> WWJavaScriptContext? {
        
        guard let script = readScript(with: path) else { return nil }
        return WWJavaScriptContext.build(script: script)
    }
    
    /// 讀取Script
    /// - Parameter filename: String
    /// - Returns: String?
    func readScript(with filename: String) -> String? {
        
        guard let sourcePath: String = Bundle.module.path(forResource: filename, ofType: nil),
              let script = try? String(contentsOfFile: sourcePath)
        else {
            return nil
        }
        
        return script
    }
    
    /// 繁簡文字轉換
    /// - Parameter type: FunctionNameType
    /// - Returns: JSValue?
    func convertSource(with type: FunctionNameType) -> JSValue? {
        
        guard let context = context,
              let script = readScript(with: "jsSource.js")
        else {
            return nil
        }
        
        _ = context.evaluateScript(script)
        
        switch type {
        case .simplifiedChinese(let source): return context.callFunctionName(type.name(), arguments: [source])
        case .traditionalChinese(let source): return context.callFunctionName(type.name(), arguments: [source])
        }
    }
}
