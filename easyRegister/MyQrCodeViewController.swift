//
//  MyQrCodeViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/11/18.
//

import Foundation
import UIKit
import CoreImage.CIFilterBuiltins
import AVFoundation



class MyQrCodeViewController: UIViewController {
    
    var imageView: UIImageView!
    
    var captureSession = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        
        imageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 250, height: 250))
        self.view.addSubview(imageView)
        
//        guard let qrURLImage = URL(string: "https://www.naver.com")?.qrImage(using: #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), logo: #imageLiteral(resourceName: "loginView")) else { return }
        guard let qrURLImage = URL(string: "www.naver.com")?.qrImage(using: #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), logo: nil) else { return }
            
            imageView.image = qrURLImage
        
        
        basicSetting()
    
        
    }
    func qrCodeMake(text: String) -> UIImage? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let stringData = text.data(using: String.Encoding.utf8)
        
          
        filter.setValue(stringData, forKey: "inputMessage")
        filter.setValue("H", forKey: "inputCorrectionLevel")
            
        if let outout = filter.outputImage {
            return UIImage(ciImage: outout, scale: 1.0, orientation: UIImage.Orientation.down)
        } else {
            return nil
        }
    }
    
}

extension URL {

   /// Creates a QR code for the current URL in the given color.
   func qrImage(using color: UIColor, logo: UIImage? = nil) -> UIImage? {
    
      guard let tintedQRImage = qrImage?.tinted(using: color) else {
         return nil
      }
    
      guard let logo = logo?.cgImage else {
         return UIImage(ciImage: tintedQRImage)
      }
    
      guard let final = tintedQRImage.combined(with: CIImage(cgImage: logo)) else {
        return UIImage(ciImage: tintedQRImage)
      }
    
    return UIImage(ciImage: final)
  }

  /// Returns a black and white QR code for this URL.
  var qrImage: CIImage? {
    guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
    let qrData = absoluteString.data(using: String.Encoding.ascii)
    qrFilter.setValue(qrData, forKey: "inputMessage")
    
    let qrTransform = CGAffineTransform(scaleX: 12, y: 12)
    return qrFilter.outputImage?.transformed(by: qrTransform)
  }
}

extension CIImage {
  /// Inverts the colors and creates a transparent image by converting the mask to alpha.
  /// Input image should be black and white.
  var transparent: CIImage? {
     return inverted?.blackTransparent
  }

  /// Inverts the colors.
  var inverted: CIImage? {
      guard let invertedColorFilter = CIFilter(name: "CIColorInvert") else { return nil }
    
    invertedColorFilter.setValue(self, forKey: "inputImage")
    return invertedColorFilter.outputImage
  }

  /// Converts all black to transparent.
  var blackTransparent: CIImage? {
      guard let blackTransparentFilter = CIFilter(name: "CIMaskToAlpha") else { return nil }
    blackTransparentFilter.setValue(self, forKey: "inputImage")
    return blackTransparentFilter.outputImage
  }

  /// Applies the given color as a tint color.
  func tinted(using color: UIColor) -> CIImage? {
     guard
        let transparentQRImage = transparent,
        let filter = CIFilter(name: "CIMultiplyCompositing"),
        let colorFilter = CIFilter(name: "CIConstantColorGenerator") else { return nil }
    
    let ciColor = CIColor(color: color)
    colorFilter.setValue(ciColor, forKey: kCIInputColorKey)
    let colorImage = colorFilter.outputImage
    
    filter.setValue(colorImage, forKey: kCIInputImageKey)
    filter.setValue(transparentQRImage, forKey: kCIInputBackgroundImageKey)
    
    return filter.outputImage!
  }
}

extension CIImage {

  /// Combines the current image with the given image centered.
  func combined(with image: CIImage) -> CIImage? {
    guard let combinedFilter = CIFilter(name: "CISourceOverCompositing") else { return nil }
    let centerTransform = CGAffineTransform(translationX: extent.midX - (image.extent.size.width / 2), y: extent.midY - (image.extent.size.height / 2))
    combinedFilter.setValue(image.transformed(by: centerTransform), forKey: "inputImage")
    combinedFilter.setValue(self, forKey: "inputBackgroundImage")
    return combinedFilter.outputImage!
  }
}




//////
///
///
extension MyQrCodeViewController {

private func basicSetting() {

    // ✅ AVCaptureDevice : capture sessions 에 대한 입력(audio or video)과 하드웨어별 캡처 기능에 대한 제어를 제공하는 장치.
    // ✅ 즉, 캡처할 방식을 정하는 코드.
    guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {

    // ✅ 시뮬레이터에서는 카메라를 사용할 수 없기 때문에 시뮬레이터에서 실행하면 에러가 발생한다.
    fatalError("No video device found")
    }
    do {

        // 2️⃣ 적절한 inputs 설정
        // ✅ AVCaptureDeviceInput : capture device 에서 capture session 으로 media 를 제공하는 capture input.
        // ✅ 즉, 특정 device 를 사용해서 input 를 초기화.
        let input = try AVCaptureDeviceInput(device: captureDevice)

        // ✅ session 에 주어진 input 를 추가.
        captureSession.addInput(input)

        // 3️⃣ 적절한 outputs 설정
        // ✅ AVCaptureMetadataOutput : capture session 에 의해서 생성된 시간제한 metadata 를 처리하기 위한 capture output.
        // ✅ 즉, 영상으로 촬영하면서 지속적으로 생성되는 metadata 를 처리하는 output 이라는 말.
        let output = AVCaptureMetadataOutput()

        // ✅ session 에 주어진 output 를 추가.
        captureSession.addOutput(output)

        // ✅ AVCaptureMetadataOutputObjectsDelegate 포로토콜을 채택하는 delegate 와 dispatch queue 를 설정한다.
        // ✅ queue : delegate 의 메서드를 실행할 큐이다. 이 큐는 metadata 가 받은 순서대로 전달되려면 반드시 serial queue(직렬큐) 여야 한다.
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)

        // ✅ 리더기가 인식할 수 있는 코드 타입을 정한다. 이 프로젝트의 경우 qr.
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]

        // ✅ 카메라 영상이 나오는 layer 와 + 모양 가이드 라인을 뷰에 추가하는 함수 호출.
        setVideoLayer()
        setGuideCrossLineView()

        // 4️⃣ startRunning() 과 stopRunning() 로 흐름 통제
        // ✅ input 에서 output 으로의 데이터 흐름을 시작
        captureSession.startRunning()
    }
    catch {
        print("error")
    }
}

// ✅ 카메라 영상이 나오는 layer 를 뷰에 추가
private func setVideoLayer() {
    // 영상을 담을 공간.
    let videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    // 카메라의 크기 지정
    videoLayer.frame = CGRect(x: 0, y: imageView.frame.maxY + 20, width: self.view.frame.size.width, height: self.view.frame.size.height / 2)
    // 카메라의 비율지정
    videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
    view.layer.addSublayer(videoLayer)
}

// ✅ + 모양 가이드라인을 뷰에 추가
private func setGuideCrossLineView() {
    let guideCrossLine = UIImageView()
    guideCrossLine.image = UIImage(systemName: "plus")
    guideCrossLine.tintColor = .green
    guideCrossLine.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(guideCrossLine)
    NSLayoutConstraint.activate([
        guideCrossLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        guideCrossLine.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        guideCrossLine.widthAnchor.constraint(equalToConstant: 30),
        guideCrossLine.heightAnchor.constraint(equalToConstant: 30)
    ])
}
}

// ✅ metadata capture ouput 에서 생성된 metatdata 를 수신하는 메서드.
// ✅ 이 프로토콜은 위에서처럼 AVCaptureMetadataOutput object 가 채택해야만 한다. 단일 메서드가 있고 옵션이다.
// ✅ 이 메서드를 사용하면 capture metadata ouput object 가 connection 을 통해서 관련된 metadata objects 를 수신할 때 응답할 수 있다.(아래 메서드의 파라미터를 통해 다룰 수 있다.)
// ✅ 즉, 이 프로토콜을 통해서 metadata 를 수신해서 반응할 수 있다.
extension MyQrCodeViewController: AVCaptureMetadataOutputObjectsDelegate {

// ✅ caputure output object 가 새로운 metadata objects 를 보냈을 때 알린다.
func metadataOutput(_ captureOutput: AVCaptureMetadataOutput,
                    didOutput metadataObjects: [AVMetadataObject],
                    from connection: AVCaptureConnection) {

    // ✅ metadataObjects : 새로 내보낸 AVMetadataObject 인스턴스 배열이다.
    if let metadataObject = metadataObjects.first {

        // ✅ AVMetadataObject 는 추상 클래스이므로 이 배열의 object 는 항상 구체적인 하위 클래스의 인스턴스여야 한다.
        // ✅ AVMetadataObject 를 직접 서브클래싱해선 안된다. 대신 AVFroundation 프레임워크에서 제공하는 정의된 하위 클래스 중 하나를 사용해야 한다.
        // ✅ AVMetadataMachineReadableCodeObject : 바코드의 기능을 정의하는 AVMetadataObject 의 구체적인 하위 클래스. 인스턴스는 이미지에서 감지된 판독 가능한 바코드의 기능과 payload 를 설명하는 immutable object 를 나타낸다.
        // ✅ (참고로 이외에도 AVMetadataFaceObject 라는 감지된 단일 얼굴의 기능을 정의하는 subclass 도 있다.)
        guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject, let stringValue = readableObject.stringValue else {
            return
        }

        // ✅ qr코드가 가진 문자열이 URL 형태를 띈다면 출력.(아무런 qr코드나 찍는다고 출력시키면 안되니까 여기서 분기처리 가능. )
        if stringValue.hasPrefix("http://") || stringValue.hasPrefix("https://")  {
            print(stringValue)

            // 4️⃣ startRunning() 과 stopRunning() 로 흐름 통제
            // ✅ input 에서 output 으로의 흐름 중지
            self.captureSession.stopRunning()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
}
