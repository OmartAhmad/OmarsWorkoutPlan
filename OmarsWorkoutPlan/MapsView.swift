import UIKit
import MapKit
import CoreLocation

class MapsView: UIViewController, CLLocationManagerDelegate {
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupLocationManager()
        setupBackButton()
        
        addAnnotations()
    }
    
    func setupMapView() {
        mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.showsUserLocation = true 
        view.addSubview(mapView)
    }
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func setupBackButton() {
        backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .blue
        backButton.layer.cornerRadius = 5
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        view.addSubview(backButton)
        view.bringSubviewToFront(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addAnnotations() {
        let places = [
            Place(name: "Gym 1, Alabama", coordinate: CLLocationCoordinate2D(latitude: 33.5186, longitude: -86.8104)),
            Place(name: "Gym 2, Alabama", coordinate: CLLocationCoordinate2D(latitude: 30.6954, longitude: -88.0399)),

            // Alaska
            Place(name: "Gym 1, Alaska", coordinate: CLLocationCoordinate2D(latitude: 61.2176, longitude: -149.8638)),
            Place(name: "Gym 2, Alaska", coordinate: CLLocationCoordinate2D(latitude: 61.1922, longitude: -149.8791)),

            // Arizona
            Place(name: "Gym 1, Arizona", coordinate: CLLocationCoordinate2D(latitude: 33.4148, longitude: -111.9093)),
            Place(name: "Gym 2, Arizona", coordinate: CLLocationCoordinate2D(latitude: 33.4484, longitude: -112.0740)),

            // Arkansas
            Place(name: "Gym 1, Arkansas", coordinate: CLLocationCoordinate2D(latitude: 34.7465, longitude: -92.2896)),
            Place(name: "Gym 2, Arkansas", coordinate: CLLocationCoordinate2D(latitude: 36.0626, longitude: -94.1574)),

            // California
            Place(name: "Gym 1, California", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
            Place(name: "Gym 2, California", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),

            // Colorado
            Place(name: "Gym 1, Colorado", coordinate: CLLocationCoordinate2D(latitude: 39.7392, longitude: -104.9903)),
            Place(name: "Gym 2, Colorado", coordinate: CLLocationCoordinate2D(latitude: 39.7392, longitude: -104.9903)),

            // Connecticut
            Place(name: "Gym 1, Connecticut", coordinate: CLLocationCoordinate2D(latitude: 41.7637, longitude: -72.6851)),
            Place(name: "Gym 2, Connecticut", coordinate: CLLocationCoordinate2D(latitude: 41.7658, longitude: -72.6734)),

            // Delaware
            Place(name: "Gym 1, Delaware", coordinate: CLLocationCoordinate2D(latitude: 39.1582, longitude: -75.5244)),
            Place(name: "Gym 2, Delaware", coordinate: CLLocationCoordinate2D(latitude: 39.7391, longitude: -75.5398)),

            // Florida
            Place(name: "Gym 1, Florida", coordinate: CLLocationCoordinate2D(latitude: 25.7617, longitude: -80.1918)),
            Place(name: "Gym 2, Florida", coordinate: CLLocationCoordinate2D(latitude: 28.5383, longitude: -81.3792)),

            // Georgia
            Place(name: "Gym 1, Georgia", coordinate: CLLocationCoordinate2D(latitude: 33.7490, longitude: -84.3880)),
            Place(name: "Gym 2, Georgia", coordinate: CLLocationCoordinate2D(latitude: 33.7489, longitude: -84.3879)),

            // Hawaii
            Place(name: "Gym 1, Hawaii", coordinate: CLLocationCoordinate2D(latitude: 21.3069, longitude: -157.8583)),
            Place(name: "Gym 2, Hawaii", coordinate: CLLocationCoordinate2D(latitude: 21.2782, longitude: -157.7862)),

            // Idaho
            Place(name: "Gym 1, Idaho", coordinate: CLLocationCoordinate2D(latitude: 43.6150, longitude: -116.2023)),
            Place(name: "Gym 2, Idaho", coordinate: CLLocationCoordinate2D(latitude: 43.6187, longitude: -116.2146)),

            // Illinois
            Place(name: "Gym 1, Illinois", coordinate: CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298)),
            Place(name: "Gym 2, Illinois", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)),

            // Indiana
            Place(name: "Gym 1, Indiana", coordinate: CLLocationCoordinate2D(latitude: 39.7684, longitude: -86.1581)),
            Place(name: "Gym 2, Indiana", coordinate: CLLocationCoordinate2D(latitude: 39.7684, longitude: -86.1581)),

            // Iowa
            Place(name: "Gym 1, Iowa", coordinate: CLLocationCoordinate2D(latitude: 41.6005, longitude: -93.6091)),
            Place(name: "Gym 2, Iowa", coordinate: CLLocationCoordinate2D(latitude: 41.6005, longitude: -93.6091)),

            // Kansas
            Place(name: "Gym 1, Kansas", coordinate: CLLocationCoordinate2D(latitude: 39.0473, longitude: -95.6752)),
            Place(name: "Gym 2, Kansas", coordinate: CLLocationCoordinate2D(latitude: 39.0997, longitude: -94.5786)),

            // Kentucky
            Place(name: "Gym 1, Kentucky", coordinate: CLLocationCoordinate2D(latitude: 38.2527, longitude: -85.7585)),
            Place(name: "Gym 2, Kentucky", coordinate: CLLocationCoordinate2D(latitude: 38.0406, longitude: -84.5037)),

            // Louisiana
            Place(name: "Gym 1, Louisiana", coordinate: CLLocationCoordinate2D(latitude: 29.9511, longitude: -90.0715)),
            Place(name: "Gym 2, Louisiana", coordinate: CLLocationCoordinate2D(latitude: 30.4583, longitude: -91.1403)),

            // Maine
            Place(name: "Gym 1, Maine", coordinate: CLLocationCoordinate2D(latitude: 43.6591, longitude: -70.2568)),
            Place(name: "Gym 2, Maine", coordinate: CLLocationCoordinate2D(latitude: 43.6591, longitude: -70.2568)),

            // Maryland
            Place(name: "Gym 1, Maryland", coordinate: CLLocationCoordinate2D(latitude: 39.2904, longitude: -76.6122)),
            Place(name: "Gym 2, Maryland", coordinate: CLLocationCoordinate2D(latitude: 39.0458, longitude: -76.6413)),

            // Massachusetts
            Place(name: "Gym 1, Massachusetts", coordinate: CLLocationCoordinate2D(latitude: 42.3601, longitude: -71.0589)),
            Place(name: "Gym 2, Massachusetts", coordinate: CLLocationCoordinate2D(latitude: 42.3601, longitude: -71.0589)),

        ]
        
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.coordinate = place.coordinate
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error)")
    }
}

struct Place {
    let name: String
    let coordinate: CLLocationCoordinate2D
}
