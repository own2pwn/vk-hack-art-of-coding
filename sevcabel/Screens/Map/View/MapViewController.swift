//
//  MapViewController.swift
//  sevcabel
//
//  Created by Anton Dryakhlykh on 09/11/2018.
//  Copyright © 2018 Ivan Smetanin. All rights reserved.
//

import Mapbox
import MapKit
import CoreLocation

final class MapViewController: UIViewController {

    // MARK: - Enums

    private enum Constants {
        static let title = "Что происходит"
        static let titleFontSize: CGFloat = 24.0
        static let titleColor = UIColor(red: 0.22, green: 0.23, blue: 0.28, alpha: 1.0)
        static let center = CLLocationCoordinate2D(latitude: 59.924303, longitude: 30.241221)
        static let zoomLevel = 15.8
        static let mapStyleURL = URL(string: "mapbox://styles/drxlx/cjobudxet2k6c2st8tv26vw49")
        static let topLeft = CLLocationCoordinate2D(latitude: 59.925371, longitude: 30.238593)
        static let topRight = CLLocationCoordinate2D(latitude: 59.925398, longitude: 30.243716)
        static let bottomRight = CLLocationCoordinate2D(latitude: 59.922833,
                                                        longitude: 30.243479)
        static let bottomLeft = CLLocationCoordinate2D(latitude: 59.922980,
                                                       longitude: 30.238486)
        static let imageName = "map"
        static let layerID = "layer"
        static let mapTintColor = UIColor(red: 0.17, green: 0.22, blue: 0.56, alpha: 1.0)
    }

    // MARK: - Constants

    private let locationManager = CLLocationManager()

    // MARK: - Properties

    var mapView: MGLMapView?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

    // MARK: - Private helpers

    private func setupInitialState() {
        configureNavigationBar()
        configureMapView()
        useLocation()
        addAnnotations()
    }

    private func configureNavigationBar() {
        navigationItem.title = nil
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: Constants.title,
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        let font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.foregroundColor: Constants.titleColor]
        navigationItem.leftBarButtonItem?.setTitleTextAttributes(attributes,
                                                                 for: .normal)
    }

    private func configureMapView() {
        let mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(Constants.center, zoomLevel: Constants.zoomLevel, animated: false)
        mapView.showsUserLocation = true
        mapView.showsUserHeadingIndicator = true
        mapView.tintColor = Constants.mapTintColor
        mapView.styleURL = Constants.mapStyleURL
        mapView.attributionButton.alpha = 0.0
        mapView.delegate = self
        view.addSubview(mapView)

        self.mapView = mapView
    }

    private func useLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    private func addAnnotations() {
        let firstCoordinate = CLLocationCoordinate2D(latitude: 59.924829, longitude: 30.239357)
        let firstAnnotation = PointAnnotation(type: .fork, coordinate: firstCoordinate)
        mapView?.addAnnotation(firstAnnotation)

        let secondCoordinate = CLLocationCoordinate2D(latitude: 59.925044, longitude: 30.239910)
        let secondAnnotation = PointAnnotation(type: .beer, coordinate: secondCoordinate)
        mapView?.addAnnotation(secondAnnotation)

        let thirdCoordinate = CLLocationCoordinate2D(latitude: 59.925286, longitude: 30.240473)
        let thirdAnnotation = PointAnnotation(type: .beer, coordinate: thirdCoordinate)
        mapView?.addAnnotation(thirdAnnotation)

        let fourthCoordinate = CLLocationCoordinate2D(latitude: 59.92516, longitude: 30.240854)
        let fourthAnnotation = PointAnnotation(type: .music, coordinate: fourthCoordinate)
        mapView?.addAnnotation(fourthAnnotation)

        let fifthCoordinate = CLLocationCoordinate2D(latitude: 59.923926, longitude: 30.240628)
        let fifthAnnotation = PointAnnotation(type: .binoculars, coordinate: fifthCoordinate)
        mapView?.addAnnotation(fifthAnnotation)

        let sixthCoordinate = CLLocationCoordinate2D(latitude: 59.923606, longitude: 30.241342)
        let sixthAnnotation = PointAnnotation(type: .binoculars, coordinate: sixthCoordinate)
        mapView?.addAnnotation(sixthAnnotation)

        let seventhCoordinate = CLLocationCoordinate2D(latitude: 59.924324, longitude: 30.240827)
        let seventhAnnotation = PointAnnotation(type: .toilet, coordinate: seventhCoordinate)
        mapView?.addAnnotation(seventhAnnotation)

        let eighthCoordinate = CLLocationCoordinate2D(latitude: 59.924249, longitude: 30.241058)
        let eighthAnnotation = PointAnnotation(type: .child, coordinate: eighthCoordinate)
        mapView?.addAnnotation(eighthAnnotation)

        let ninthCoordinate = CLLocationCoordinate2D(latitude: 59.924563, longitude: 30.241337)
        let ninthAnnotation = PointAnnotation(type: .coffee, coordinate: ninthCoordinate)
        mapView?.addAnnotation(ninthAnnotation)

        let tenthCoordinate = CLLocationCoordinate2D(latitude: 59.924665, longitude: 30.241578)
        let tenthAnnotation = PointAnnotation(type: .coffee, coordinate: tenthCoordinate)
        mapView?.addAnnotation(tenthAnnotation)

        let eleventhCoordinate = CLLocationCoordinate2D(latitude: 59.924552, longitude: 30.241857)
        let eleventhAnnotation = PointAnnotation(type: .coffee, coordinate: eleventhCoordinate)
        mapView?.addAnnotation(eleventhAnnotation)

        let twelvethCoordinate = CLLocationCoordinate2D(latitude: 59.924407, longitude: 30.242136)
        let twelvethAnnotation = PointAnnotation(type: .fork, coordinate: twelvethCoordinate)
        mapView?.addAnnotation(twelvethAnnotation)

        let thirteenthCoordinate = CLLocationCoordinate2D(latitude: 59.924262, longitude: 30.241937)
        let thirteenthAnnotation = PointAnnotation(type: .fork, coordinate: thirteenthCoordinate)
        mapView?.addAnnotation(thirteenthAnnotation)

        let fourteenthCoordinate = CLLocationCoordinate2D(latitude: 59.924340, longitude: 30.241717)
        let fourteenthAnnotation = PointAnnotation(type: .shop, coordinate: fourteenthCoordinate)
        mapView?.addAnnotation(fourteenthAnnotation)

        let fifteenthCoordinate = CLLocationCoordinate2D(latitude: 59.924389, longitude: 30.241543)
        let fifteenthAnnotation = PointAnnotation(type: .shop, coordinate: fifteenthCoordinate)
        mapView?.addAnnotation(fifteenthAnnotation)
    }
}

// MARK: - MKMapViewDelegate

extension MapViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        let coordinates = MGLCoordinateQuad(
            topLeft: Constants.topLeft,
            bottomLeft: Constants.bottomLeft,
            bottomRight: Constants.bottomRight,
            topRight: Constants.topRight)

        guard let image = UIImage(named: Constants.imageName) else { return }
        let source = MGLImageSource(identifier: Constants.imageName,
                                    coordinateQuad: coordinates,
                                    image: image)

        style.addSource(source)

        let mapLayer = MGLRasterStyleLayer(identifier: Constants.layerID, source: source)

        for layer in style.layers.reversed() {
            if layer is MGLSymbolStyleLayer {
                style.insertLayer(mapLayer, below: layer)
                break
            }
        }
    }

    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        if annotation is PointAnnotation {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "some")
            return annotationView
        } else if annotation is MGLUserLocation {
            let annotationView = MGLUserLocationAnnotationView()
            annotationView.tintColor = .red
            return annotationView
        } else {
            return nil
        }
    }

    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
        return (annotation as? PointAnnotation)?.image
    }
}