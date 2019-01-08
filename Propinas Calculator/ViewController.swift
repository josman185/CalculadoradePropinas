//
//  ViewController.swift
//  Propinas Calculator
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
// Primer Commit

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var porcentajes:[Int] = []
    @IBOutlet weak var montoFactxt: UITextField!
    @IBOutlet weak var picker_propinas: UIPickerView!
    @IBOutlet weak var propinacalculada_Lbl: UILabel!
    @IBOutlet weak var totalPagar_lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        porcentajes = [5,10,15,20,25,30]
        picker_propinas.delegate = self
        picker_propinas.dataSource = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return porcentajes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(porcentajes[row])"
    }
    
    @IBAction func btnCalcular(_ sender: Any) {
        if let montoFactura = montoFactxt?.text! {
            if let montoFacturaDouble = Double(montoFactura) {
                print("\(String(describing: montoFacturaDouble))")
                //let porcenProp = picker_propinas.selectedRow(inComponent: 0)
                let porcenProp = Double(porcentajes[picker_propinas.selectedRow(inComponent: 0)])
                print(porcenProp)
                let valorProp = Double(porcenProp / 100)
                print("Valor propina: \(valorProp)")
                let propinaFinal = (montoFacturaDouble * valorProp)
                propinacalculada_Lbl.text = "\(propinaFinal)"
                totalPagar_lbl.text = "\(montoFacturaDouble + propinaFinal)"
            }  else {
                print("por favor ingrese un monto valido")
            }
        }
    }
    
    

}
