//
//  DoormanQRView.swift
//  SEA
//
//  Created by Sanskar IOS Dev on 07/02/26.
//
import SwiftUI
import AudioToolbox

struct DoormanQRView: View {

    @State private var scannedText: String = ""
    @State private var isScanning = true
    @State private var isAutoScanEnabled = true
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {

            Text("Scan QR Tickets")
                .font(.title2)
                .bold()

            Toggle("Auto Scan", isOn: $isAutoScanEnabled)
                .padding(.horizontal)
                .onChange(of: isAutoScanEnabled) { _ in
                    resetScanner()
                }

            ZStack {
                QRCodeScannerView { newValue in
                    guard isScanning else { return }
                    guard !newValue.isEmpty else { return }
                    scannedText = newValue
                    isScanning = false
                    if isAutoScanEnabled {
                        handleScannedQR(newValue)
                    }
                }
                .frame(width: 300, height: 300)
                .border(Color.gray, width: 2)
            }

            if !isAutoScanEnabled && !scannedText.isEmpty {
                PrimaryButton(
                    title: "CONFIRM TICKET",
                    backgroundColor: .purple,
                    titleColor: .white
                ) {
                    handleScannedQR(scannedText)
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Doorman QR")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Helpers
    private func handleScannedQR(_ code: String) {
        print("QR Scanned:", code)
        print("Doorman added with QR:", scannedText)
        playBeepSound()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
//            dismiss()
//        }
    }
    private func playBeepSound() {
        AudioServicesPlaySystemSound(SystemSoundID(1057))
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    private func resetScanner() {
        scannedText = ""
        isScanning = true
    }
}
