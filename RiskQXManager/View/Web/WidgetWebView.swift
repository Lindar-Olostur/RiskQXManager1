//
//  WidgetWebView.swift
//  RiskQXManager
//

import SwiftUI
import WebKit

struct WidgetWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    let webView: WKWebView

    init(htmlString: String) {
        let configuration = WKWebViewConfiguration()
        let script = "var script = document.createElement('meta'); script.name = 'viewport'; script.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'; document.head.appendChild(script);"
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        configuration.userContentController.addUserScript(userScript)

        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.loadHTMLString(htmlString, baseURL: nil)
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


struct MyWidgetWebView: View {
    let webView: WidgetWebView
    @State var htmlString: String = ""
    @State private var isWebViewVisible = false
    
    init(htmlString: String) {
        webView = WidgetWebView(htmlString: htmlString)
    }
    
    var body: some View {
        ZStack {
            OnboardingTemplate()
            VStack {
                webView.background(Color.clear)
                    .padding(-10)
                    .opacity(isWebViewVisible ? 1 : 0) // Применяем opacity
                                    .onAppear {
                                        withAnimation(.easeIn(duration: 0.25)) { // Применяем анимацию
                                            isWebViewVisible = true
                                        }
                                    }
                    .onReceive(webView.webView.publisher(for: \.url), perform: { newURL in
                        if let newURL = newURL {
                            htmlString = newURL.absoluteString
                        }
                    })
            }
        }
    }
}
#Preview {
    MyWidgetWebView(htmlString: """
                            <!-- TradingView Chart BEGIN -->
                            <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                            <script type="text/javascript">
                            var tradingview_embed_options = {};
                            tradingview_embed_options.width = '640';
                            tradingview_embed_options.height = '400';
                            tradingview_embed_options.chart = 'eMn2CKAf';
                            new TradingView.chart(tradingview_embed_options);
                            </script>
                            <p><a href="https://www.tradingview.com/chart/BTCUSD/eMn2CKAf-Deciphering-DXY-The-Dollar-Index-Explained/">Deciphering DXY: The Dollar Index Explained 💵📊</a> by <a href="https://www.tradingview.com/u/UnitedSignals/">UnitedSignals</a> on <a href="https://www.tradingview.com/">TradingView.com</a></p>
                            <!-- TradingView Chart END -->
                        """)
}
