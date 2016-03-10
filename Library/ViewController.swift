//
//  ViewController.swift
//  Library
//
//  Created by Carlos Buitrago on 10/03/16.
//  Copyright © 2016 Carlos Buitrago. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var texto: UITextView!
    @IBOutlet weak var textoIn: UITextField!
    @IBOutlet weak var boton: UIButton!
    
    let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textoIn.delegate = self
        boton.layer.cornerRadius = 10
        boton.layer.masksToBounds = true
        boton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func limpiar(sender: AnyObject) {
        textoIn.text = ""
        texto.text = ""
    }
    @IBAction func backGroundTap(sender:UIControl){
        textoIn.resignFirstResponder()
    }
    @IBAction func textFieldDoneEditing(sender:UITextField){
        sender.resignFirstResponder()
        let urls2 = urls + textoIn.text!
        let url = NSURL(string: urls2)
        let datos:NSData? = NSData(contentsOfURL: url!)
        if datos != nil{
        let textoS = NSString(data: datos!, encoding: NSUTF8StringEncoding)
        texto.text = String(textoS)
        }
        else {
            let alert = UIAlertController(title:"Error", message: "No hay conexion a Internet", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)

        }
        
    }

}

