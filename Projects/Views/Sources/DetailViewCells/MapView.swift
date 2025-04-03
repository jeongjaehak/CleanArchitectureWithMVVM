//
//  MapView.swift
//  Views
//
//  Created by 정재학 on 4/3/25.
//

import Entities
import SwiftUI
import MapKit

/// 위도/경도 데이터를 받아 애플맵에 핀을 꽂아 보여주는 뷰
struct MapView: View {
    
    // MARK: - MapPin
    
    /// Identifiable을 따르는 핀 데이터 모델
    private struct MapPin: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    // MARK: - Properties
    
    @State private var cameraPosition: MapCameraPosition
    private let pinLocation: MapPin? // Identifiable 타입 사용
    private let pinName: String
    
    // MARK: - Init

    /// 위도/경도 정보를 받아 맵에 핀을 꽂는다.
    /// - Parameter location: 핀 위치
    /// - Parameter pinName: 핀에 표시할 텍스트
    init( location: Geo, pinName: String ) {
        let initialLocation = CLLocationCoordinate2D(latitude: Double(location.latitude) ?? 0,
                                                     longitude: Double(location.longitude) ?? 0)
        let initialRegion = MKCoordinateRegion(
            center: initialLocation,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        
        _cameraPosition = State(initialValue: .region(initialRegion))
        pinLocation = MapPin(coordinate: initialLocation)
        self.pinName = pinName
    }

    // MARK: - Body
    
    var body: some View {
        VStack {
            Map(position: $cameraPosition) {
                if let pin = pinLocation {
                    Annotation(pinName, coordinate: pin.coordinate) {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                    }
                }
            }
            .mapControls { MapUserLocationButton() }
            .frame(height: 400)
            .cornerRadius(12)
        }
    }
}

// MARK: - Preview

struct MapViewPreviews: PreviewProvider {
    static var previews: some View {
        MapView(location: TestData.geo, pinName: TestData.address.city) // 서울 좌표
    }
}
