////
////  
//  MyWebView.swift
//  RiskQXManager
//

//
import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    let webView: WKWebView

    init(urlString: String) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)

        let configuration = WKWebViewConfiguration()
        let script = "var script = document.createElement('meta'); script.name = 'viewport'; script.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'; document.head.appendChild(script);"
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        configuration.userContentController.addUserScript(userScript)

        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.load(request)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.isOpaque = false
        webView.backgroundColor = .clear
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    func goBack() {
        webView.goBack()
    }
    
    func refresh() {
        webView.reload()
    }
}


struct MyWebView: View {
    let webView: SwiftUIWebView
    @State var urlText: String = ""
    @State var withMenu = true
    
    init(urlString: String) {
        webView = SwiftUIWebView(urlString: urlString)
    }
    
    var body: some View {
        VStack {
            if withMenu {
                HStack {
                    Button(action: {
                        webView.goBack()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20))
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }.padding(.horizontal)
                    Spacer()
    //                Button(action: {
    //                    webView.goHome()
    //                }) {
    //                    Image(systemName: "house.fill")
    //                        .font(.title)
    //                        .foregroundColor(.blue)
    //                        .padding()
    //                }
    //                Spacer()
                    Button(action: {
                        webView.refresh()
                        print(urlText)
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 20))
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }.padding(.horizontal)
    //                Spacer()
    //                Button(action: {
    //                    webView.goForward()
    //                }) {
    //                    Image(systemName: "arrowtriangle.right.fill")
    //                        .font(.title)
    //                        .foregroundColor(.blue)
    //                        .padding()
    //                }
                }
                .padding(.vertical, -8)
            }
            webView//.background(Color.blue)
                .onReceive(webView.webView.publisher(for: \.url), perform: { newURL in
                    if let newURL = newURL {
                        urlText = newURL.absoluteString
                    }
                })
        }
    }
}


struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlString: "https://www.tradingview.com/education/riskmanagement/")
    }
}
