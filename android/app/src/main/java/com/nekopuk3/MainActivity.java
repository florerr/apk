package com.nekopuk3;

import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        WebView webView = new WebView(this);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.setWebViewClient(new WebViewClient());
        
        // Load the HTML content
        String htmlContent = "<!DOCTYPE html>" +
            "<html><head>" +
            "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
            "<style>" +
            "body { font-family: Arial; margin: 0; padding: 20px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; }" +
            ".container { background: white; border-radius: 20px; padding: 30px; text-align: center; }" +
            "h1 { color: #6200ee; margin-bottom: 20px; }" +
            ".logo { font-size: 80px; margin: 20px 0; }" +
            "p { color: #666; line-height: 1.6; }" +
            "</style>" +
            "</head><body>" +
            "<div class='container'>" +
            "<div class='logo'>🐱</div>" +
            "<h1>Neko Puk3</h1>" +
            "<p>Добро пожаловать в приложение Neko Puk3!</p>" +
            "<p>Версия: 1.0.0</p>" +
            "</div>" +
            "</body></html>";
        
        webView.loadData(htmlContent, "text/html", "UTF-8");
        setContentView(webView);
    }
}