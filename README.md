# FaceIDTutorial-iOS
π¨ Face ID λ₯Ό νμ©ν μ€μΉν μμ²΄μΈμ μΈμ¦ μ€ν

# μμ μ 

## π [Local Authentication](https://developer.apple.com/documentation/localauthentication/)

Authenticate users biometrically(μμ²΄μΈμ)  λλ μ΄λ―Έ μκ³  μλ passphrase(μνΈ)λ‘ μ¬μ©μλ₯Ό μΈμ¦ν©λλ€.

**Overview**

λ§μ μ¬μ©μκ° TouchID λλ FaceID μ κ°μ μμ²΄μΈμμ μμ‘΄ν΄μ μ₯λΉμ μμ½κ² μ κ·Όν  μ μλ€. λμ²΄ μ΅μμΌλ‘ μμ²΄ μΈμμ΄ μλ κ²½μ° μνΈκ° λΉμ·ν μ©λλ‘ νμ©λλ€. `LocalAuthentication` νλ μμν¬λ₯Ό μ¬μ©νμ¬ μ±μμ μ΄λ¬ν λ©μ»€λμ¦μ νμ©νκ³  μ΄λ―Έ κ΅¬νν μΈμ¦ μ μ°¨λ₯Ό νμ₯ν  μ μλ€.

<img src = "https://user-images.githubusercontent.com/69136340/132942269-f0859ac9-2896-4bb9-a361-7a12452b7b4f.png" width ="600">

λ³΄μμ κ·ΉλννκΈ° μν΄μ underlying authentication data(κΈ°λ³Έ μΈμ¦ λ°μ΄ν°)μ μ κ·Όν  μ μλ€. μλ₯Όλ€μ΄ μ§λ¬Έ μ΄λ―Έμ§μ μ κ·Όν  μ μλ€λ λ»μ΄λ€. μμ€νμ λλ¨Έμ§ λΆλΆκ³Ό κ²©λ¦¬λ νλμ¨μ΄ κΈ°λ° λ³΄μ νλ‘μΈμμΈ Secure Enclaveλ μ΄ λ°μ΄ν°λ₯Ό μ΄μ μ²΄μ μ μλ§μ  λΏμ§ μλ κ³³μ κ΄λ¦¬ν©λλ€.

**λμ  νΉμ  policy λ₯Ό μ§μ νκ³  μ¬μ©μμκ² μΈμ¦μ μνλ μ΄μ λ₯Ό μλ €μ£Όλ λ©μμ§μ μ κ³΅**ν©λλ€. κ·Έλ° λ€μ Secure Enclave μ μ‘°μ νμ¬ μμμ μννλ€. **μ΄νμλ** **μ±κ³΅κ³Ό μ€ν¨λ₯Ό λνλ΄λ Boolean κ²°κ³Όλ§ μ»λλ€.**

## π μ΄μ  μ νμμ μ κ³΅νλ μμ μ½λμ λν΄μ μμλ³΄μ

[Apple Developer Documentation](https://developer.apple.com/documentation/localauthentication/logging_a_user_into_your_app_with_face_id_or_touch_id)

### Overview

μ¬μ©μλ Touch ID μ Face ID μ κ°μ μΈμ¦ λ§€μ»€λμ¦μ ν΅ν΄μ μ₯μΉμ μ½κ² μ κ·Όν  μ μκΈ° λλ¬Έμ μ’μνλ€. `LocalAuthentication` νλ μμν¬λ₯Ό μ±ννλ©΄ μΌλ°μ μΈ κ²½μ° μ¬μ©μ μΈκ²½ κ²½νμ κ°μννλ λμμ μμ²΄μΈμμ μ¬μ©ν  μ μμ λλ₯Ό λλΉν λμ²΄ μ΅μλ μ κ³΅νλ€.

### Set the Face ID Usage Description

biometrics λ₯Ό μ¬μ©νλ λͺ¨λ   νλ‘μ νΈμμ  Info.plist νμΌμ `NSFaceIDUsageDescription` ν€λ₯Ό κ°μ§λ€. μ΄ ν€κ° μμΌλ©΄ μμ€νμ μ±μ΄ Face ID λ₯Ό μ¬μ©μ νλ½νμ§ μλλ€. ν€μ κ°μ μ¬μ©μκ° μ²μμΌλ‘ Face ID λ₯Ό μ¬μ©ν  λ μμ€νμ΄ λ³΄μ¬μ£Όλ λ¬Έμμ΄μ΄λ€. λ¬Έμμ΄μ μ±μ΄ μ΄ μΈμ¦ λ§€μ»€λμ¦μ μ‘μΈμ€ν΄μΌ νλ μ΄μ λ₯Ό λͺννκ² μ€λͺν΄μ€λ€. μμ€νμ Touch ID μ λν μ μ¬ν μ¬μ© μ€λͺμ νμλ‘ νμ§ μλλ€.

(key λ‘ Privacy - Face ID Usage Description λ₯Ό μ¬μ©ν΄λ κ°λ₯νλ€. μ΄μ°¨νΌ μμ ν€κ°μ μλ ₯νλ©΄ λ³νλλ€.)

### Create and Configure a Context

μ±μμ LAContext μΈμ€ν΄μ€λ₯Ό μ¬μ©ν΄μ μμ²΄μΈμ μΈμ¦μ μ¬μ©ν  μ μλ€. (LAContext λ Secure Enclave μ μ±κ³Όμ μνΈμμ©μ μ€κ°νλ€.) context λ₯Ό μμ±νλ©° μμνλ€ :

```swift
var context = LAContext()
```

context μμ μ¬μ©νλ λ©μμ§μ μ»€μ€νν΄μ μ μ λ₯Ό νλ¦μΌλ‘ μλ΄ν  μ μλ€. μλ₯Ό λ€μ΄, λ€μν alert view μ λνλλ Cancel button μ λν μ»€μ€ν λ©μμ§λ₯Ό μ€μ ν  μ μλ€.

```swift
context.localizedCancelTitle = "Enter Username/Password"
```

μ΄κ²μ μ¬μ©μκ° λ²νΌμ ν­νλ©΄ μΌλ° μΈμ¦ μ μ°¨λ‘ λλμκ° κ²μ μ΄ν΄νλλ° λμμ΄ λλ€.

### Test Policy Availability

μΈμ¦μ μλνκΈ° μ μ [canEvaluatePolicy(_:error:)](https://developer.apple.com/documentation/localauthentication/lacontext/1514149-canevaluatepolicy) λ©μλλ₯Ό νΈμΆν΄μ μΈμ¦ν  μ μλμ§ νμ€νΈν  μ μλ€.

```swift
var error: NSError?
if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
```

νμ€νΈ ν  LAPolicy μ΄κ±°μμ κ°μ μ ννλ€. poicy λ μΈμ¦μ΄ μλνλ λ°©μμ μ μ΄νλ€. μλ₯Ό λ€μ΄, μμ μ½λμμ μ¬μ©λ `LAPolicy.deviceOwnerAuthentication` μ μμ±μΈμμ΄ μ€ν¨νκ±°λ μ¬μ©ν  μ μλ κ²½μ° passcode λ‘ λλλ¦΄ μ μλ€. λλ passcode λ‘ λλ¦΄ μ μλ `LAPolicy.deviceOwnerAuthenticationWithBiometrics` λ‘ μ§μ ν  μλ μλ€.

### Evaluate a Policy

μΈμ¦ν  μ€λΉκ° λλ©΄ μ΄λ―Έ νμ€νΈν policy μ λμΌν policy λ₯Ό μ¬μ©ν΄μ [evaluatePolicy(_:localizedReason:reply:)](https://developer.apple.com/documentation/localauthentication/lacontext/1514176-evaluatepolicy) λ₯Ό νΈμΆνλ€. 

```swift
let reason = "Log in to your account"
context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

    if success {

        // Move to the main thread because a state update triggers UI changes.
        DispatchQueue.main.async { [unowned self] in
            self.state = .loggedin
        }

    } else {
        print(error?.localizedDescription ?? "Failed to authenticate")

        // Fall back to a asking for username and password.
        // ...
    }
}
```

Touch ID μ κ²½μ° λλ μ¬μ©μκ° passcode λ₯Ό μλ ₯νλ©΄ μμ€νμ μμ λ©μλμμ μ κ³΅νλ `reason` μ μΈμ¦ μ΄μ λ‘ νμνλ€.

(λ€μκ³Ό κ°μ΄ "Log in to your account" λ¬Έμμ΄μ΄ passcode μ¬μ© μ μΈμ¦ μ΄μ λ‘ νμλλ€.)

<img src ="https://user-images.githubusercontent.com/69136340/132942295-411b7593-787e-4160-9ac6-2e8c1308589c.jpeg" width ="250">

μ±μ΄ μ¬μ©μμκ² μΈμ¦μ μμ²­νλ μ΄μ μ λν΄μ μ΄μνλ λͺ¨λ  μ§μ­μ localized λ λͺνν μ€λͺμ μ κ³΅νλ κ²μ μ€μνλ€. μ± μ΄λ¦μ μμ μ¬μ§μ²λΌ μ΄μ  μμ μ΄λ―Έ λνλλ―λ‘ λ©μμ§μ ν¬ν¨μν¬ νμκ° μλ€.

### Optionally, Adjust Your User Interface to Accommodate Face ID

μμ²΄ μΈμ μ€μΊ μμμ μ μΈνκ³  Face ID λ Touch ID μ μ€μν μ°¨μ΄μ μ λ³΄μ¬μ€λ€.

- μ±μ΄ Touch ID λ₯Ό μ¬μ©νλ €κ³  νλ©΄ μκ°λ½μ μ μνλΌλ μμ€ν λ©μμ§κ° νμλλ€. μ¬μ©μλ νλ‘¬ννΈλ₯Ό μ·¨μνμ¬ μμμ λν΄ μκ°νκ³  μ·¨μν  μκ°μ΄ μλ€. Face ID λ₯Ό νΈμΆν λλ κΈ°κΈ°κ° λ°λ‘ μ¬μ©μμ μΌκ΅΄μ μ€μΊνκΈ° μμνλ€. μ¬μ©μλ μ·¨μν  μ μλ λ§μ§λ§ κΈ°νλ₯Ό μ»μ§ λͺ»νλ€.

μ΄λ¬ν λμ μ°¨μ΄λ₯Ό μμ©νκΈ° μν΄μ μμ²΄ μΈμ μ’λ₯μ λ°λΌ λ€λ₯Έ UI λ₯Ό μ κ³΅ν  μ μλ€.

μλμ κ°μ μ ν μν μ±μ κ²½μ° λ²νΌμ ν­νλ©΄ μ¦κ°μ μΈ Face ID μ€μΊμ΄ λ°μνλ κ²μ κ²½κ³ λ©μμ§ νμ€νΈ λΌλ²¨μ ν¬ν¨νμ¬ λ€λ₯Έ UI λ‘ μ κ³΅νλ€. 

<img src ="https://user-images.githubusercontent.com/69136340/132942306-1d4d8797-4ec0-461f-b7f9-352fce16a504.png" width ="250">
context μ biometryTpe νλΌλ―Έν°λ₯Ό μ½μ΄μ μ₯μΉκ° μ΄λ€ biometry λ₯Ό μ§μνλμ§ νμ€νΈν  μ μλ€.

(λ€μμ μ½λλ **Face ID λ₯Ό μ§μνλ μλ λλ°μ΄μ€μ κ²½μ°** νΉμ μ΄λ―Έ λ‘κ·ΈμΈλ κ²½μ° Face ID μΈμ¦ λΌλ²¨μ hidden μν€λ μ½λμ΄λ€.)

```swift
faceIDLabel.isHidden = (state == .loggedin) || (context.biometryType != .faceID)
```

(λ€μμ Face ID λ₯Ό μ§μνμ§ μλ iPhone SE 2μΈλμ΄λ€. μ€ννμ κ²½μ°μ λΌλ²¨μ΄ hidden λ κ²μ λ³Ό μ μλ€.)

<img src="https://user-images.githubusercontent.com/69136340/132942307-8294d53b-7b59-4ae1-961c-671eb526baea.png" width ="250">

### Provide a Fallback Alternative to Biometrics

λ€μν μ΄μ λ‘ μΈμ¦μ μ€ν¨νκ±°λ μ¬μ©ν  μ μλ κ²½μ°κ° μλ€.

- The userβs device doesnβt have Touch ID or Face ID.
- The user isnβt enrolled in biometrics, or doesnβt have a passcode set.
- The user cancels the operation.
- Touch ID or Face ID fails to recognize the user.
- Youβve previously invalidated the context with a call to theΒ [invalidate()](https://developer.apple.com/documentation/localauthentication/lacontext/1514192-invalidate)Β method.(invalidate() λ©μλλ₯Ό νΈμΆν΄μ context λ₯Ό λ¬΄ν¨ννλ κ²μ λ§νλ€. )

κ°λ₯ν error μ‘°κ±΄μ μ μ²΄ λͺ©λ‘μ [LAError.Code](https://developer.apple.com/documentation/localauthentication/laerror/code/) λ₯Ό μ°Έμ‘°νμ.

μν μ±μ λμ²΄ μΈμ¦μ κ΅¬ννμ§ μμλ€. μ€μ  μ±μμλ local authentication error κ° λ°μνλ©΄ μ¬μ©μ μ΄λ¦κ³Ό λΉλ°λ²νΈλ₯Ό λ¬»λ κ²κ³Ό κ°μ κ³ μ ν μΈμ¦ μ²΄κ³λ‘ λμ²΄νλ€. (μ¦, μ μΌν μΈμ¦μ΅μμΌλ‘ λνμ§ λ§λΌλ κ².)

μ΄λ―Έ νλ μΌμ λ³΄μμ±μΌλ‘ biometrics λ₯Ό μ κ³΅ν΄λΌ. μ μΌν μΈμ¦ μ΅μμΌλ‘ biometrics λ₯Ό μμ‘΄νμ§ λ§λΌ.

## π [LAError](https://developer.apple.com/documentation/localauthentication/laerror)

LocalAuthentication νλ μμν¬μμ λ°μν μ€λ₯.

### π [LAError.Codes](https://developer.apple.com/documentation/localauthentication/laerror/code)

policy νκ°μ μ€ν¨νμ λ LocalAuthentication νλ μμν¬κ° λ°ννλ Error codes μ΄λ€.

λ΄μ©μ λ³΄λ©΄ Biometry Failure μ ν΄λΉνλ μλ¬μ½λκ° μλ€.

# μμνκΈ°

μμ΄ν° κΈ°κΈ°κ° Face ID λ₯Ό μ§μν΄μΌνκ³  Face ID λ₯Ό μ¬μ©νκ³  μλ μν©μμ κ°λ₯νλ€. 

## π νλ‘μ νΈ μ€μ 

- Info.plist νμΌ

<img src ="https://user-images.githubusercontent.com/69136340/132942409-3a5b0e7e-bd27-4806-84c5-fd0c121bda3d.png" width ="700">

- Face ID μ¬μ©

```swift
import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    // β νμ¬ λ‘κ·ΈμΈ μνμ λ°λ₯Έ UI λ³ν
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
            // β LAContext λ‘ Secure Enclave μ μ±κ³Όμ μνΈμμ©μ μ€κ°.
            let context = LAContext()
            
            // β alert view μμ cancel button λ©μμ§.
            context.localizedCancelTitle = "Enter Username/Password"
            
            var error: NSError?
            
            // β μ§μ ν policy λ‘ biometrics μΈμ¦μ΄ κ°λ₯νμ§ νμ€νΈ.
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
                
                let reason = "Log in to your account"
                
                // β μ§μ ν policy λ‘ biometrics μΈμ¦ μμ.
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
                    if success {
                        // β state μλ°μ΄νΈλ UI λ³νλ₯Ό μΌμΌμΌμ main thread μμ μ²λ¦¬ν΄μΌνλ€.
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
```

## μλ?¬λ μ΄ν°μμ Face ID μ€νν΄λ³΄κΈ°

- Features β Face ID β Enrolled λ‘ νμ±νν΄μ€λ€.
- (νμ±ν μ΄μ μ μμ²΄μΈμ μΈμ¦μ μλνλ©΄ passcode λ₯Ό μλ ₯λ°μΌλ € νλ€.)

<img src ="https://user-images.githubusercontent.com/69136340/132942442-cf22c39b-af0c-4e9d-905e-6f3b13839f11.png" width ="450">

- Face ID λ₯Ό λ§€μΉ­ / λΉλ§€μΉ­ μ νν  μ μλ€.

<img src ="https://user-images.githubusercontent.com/69136340/132942444-b9e7d2af-465b-4dc4-932d-910acf01f34b.png" width ="450">

### κ²°κ³Ό
<img src ="https://user-images.githubusercontent.com/69136340/132942657-925d5a70-5982-4abb-af10-89b65535e1b5.gif" width ="250">

### μΆμ²

[Apple Developer Documentation](https://developer.apple.com/documentation/localauthentication/)
