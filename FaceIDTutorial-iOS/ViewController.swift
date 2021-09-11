//
//  ViewController.swift
//  FaceIDTutorial-iOS
//
//  Created by kimhyungyu on 2021/09/10.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    // 현재 로그인 상태에 따른 UI 변화
    var state = AuthenticationState.loggedout {
        didSet {
            if state == .loggedin {
                loginButton.setTitle("Logout", for: .normal)
            } else {
                loginButton.setTitle("Login", for: .normal)
            }
        }
    }
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.setTitle("Login", for: .normal)
    }
    
    @IBAction func touchLoginButton(_ sender: Any) {
        if state == .loggedin {
            
            state = .loggedout
        
        } else {
            // LAContext 로 Secure Enclave 와 앱과의 상호작용을 중개.
            let context = LAContext()
            
            // alert view 에서 cancel button 메시지.
            context.localizedCancelTitle = "Enter Username/Password"
            
            var error: NSError?
            
            // 해당 policy 로 biometrics 가 가능한지 테스트.
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
                
                let reason = "Log in to your account"
                
                // biometrics 인증 시작.
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
                    if success {
                        // state 업데이트는 UI 변화를 일으켜서 main thread 에서 처리해야한다.
                        DispatchQueue.main.async { [unowned self] in
                            self.state = .loggedin
                            print("state : \(self.state)")
                        }
                    } else {
                        print(error?.localizedDescription ?? "Failed to authenticate")
                        
                        // Fall back to a asking for username and password.
                        // ...
                    }
                }
            }
        }
    }
}

