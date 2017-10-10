//
//  ViewController.swift
//  Contacts
//
//  Created by Jesus Quezada on 10/2/17.
//  Copyright © 2017 Jesus Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBAction func btnBack(_ sender: UIButton) {
        
        
        
        //Set ScrollPoint and Go to ZERO location (Top) of ScrollView - animated
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        //set txtFirst as firstresponder
        txtFirst.becomeFirstResponder()
        
        
    }
    
    @IBOutlet weak var txtContacts: UITextView!
    
    
    @IBOutlet weak var txtFirst: UITextField!
    
    @IBOutlet weak var txtLast: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtState: UITextField!
    
    @IBOutlet weak var txtZip: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    


    @IBAction func btnView(_ sender: UIButton) {
        //hide keyboard
        
        DismissKeyboard()
        
        //declare CGPoint scrollPoint
        var scrollPoint:CGPoint
        
        //X = from Left, Y = from Top
        //get X = 0, Y = location of btnBack Y
        scrollPoint = CGPoint(x: 0, y: btnBack.frame.origin.y)
        
        //Set ScrollPoint and Go to animated
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    
}
        
        
        
    
    
    @IBAction func btnSave(_ sender: UIButton) {
        
        
        //hide keyboard
        DismissKeyboard()
        
        //validation that all fields are entered
        if (txtFirst.text=="" || txtLast.text=="" || txtEmail.text=="" || txtAddress.text=="" || txtZip.text=="" || txtState.text=="" || txtCity.text=="" || txtPhone.text=="")
        {
            //Call MessageBox if any fields are empty
           MsgBox("All fields required, please correct")
        }
        else
        {
            
            //Check if txtContacts (UITextView) is empty
            if (txtContacts.text=="")
            {
                //if empty then add text and newline
                txtContacts.text = "MyContacts \n"
            }
            //format text
            
            //existing contents of txtContacts, newline, txtFirst, newline, txtLast, newline, txtEmail, newline
            txtContacts.text = "\(txtContacts.text!) \n\(txtFirst.text!) \n\(txtLast.text!) \n\(txtAddress.text!)\n\(txtState.text!) \n\(txtCity.text!) \n\(txtZip.text!) \n\(txtPhone.text!) \n\(txtEmail.text!)\n"
            //clear textboxes
            txtFirst.text = ""
            txtLast.text = ""
            txtAddress.text = ""
            txtCity.text = ""
            txtState.text = ""
            txtZip.text = ""
            txtPhone.text = ""
            txtEmail.text = ""
            //load scrollview
            
            //declare CGPoint scrollPoint
            
            var scrollPoint:CGPoint
            
            //X = from Left, Y = from Top
            //get X = 0, Y = location of btnBack Y
            scrollPoint = CGPoint(x:0, y:btnBack.frame.origin.y)
            //Set ScrollPoint and Go to animated
            ScrollView.setContentOffset(scrollPoint, animated: true)
            
        }
        
    
    }
        
    
    
    

    
    func MsgBox(_ message:String)
    {
        //Create Alert
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = message
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    
    
    // 2) Add touchesBegan function to catch screen tap and resign keyboard
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        //forces resign first responder and hides keyboard
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtAddress.endEditing(true)
        txtCity.endEditing(true)
        txtState.endEditing(true)
        txtZip.endEditing(true)
        txtPhone.endEditing(true)
        txtEmail.endEditing(true)
        
        
    }

    // 3) Add DismissKeyboard function to resign keyboard on all textboxes
    func DismissKeyboard(){
        
        //forces resign first responder and hides keyboard
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtAddress.endEditing(true)
        txtCity.endEditing(true)
        txtState.endEditing(true)
        txtZip.endEditing(true)
        txtPhone.endEditing(true)
        txtEmail.endEditing(true)
    
    }
    
    
    
    //  4) Add textFieldShouldReturn function. This is called when 'return' key pressed on any UITextField. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool     {
        
        textField.resignFirstResponder()
        return true;
    }
    
    //  5) Add textFieldDidBeginEditing function. ScrollPoint when entering UItextfied
    func textFieldDidBeginEditing(_ textField:UITextField){
        
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
    
    // 6) Add textFieldDidEndEditing function. ScrollPoint when done editing UItextfied
    func textFieldDidEndEditing(_ textField:UITextField){
        
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    
    // 7) Add textViewDidBeginEditing function. ScrollPoint when entering UItextView
    func textViewDidBeginEditing(_ textField:UITextView){
    
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
    // 8) Add textViewDidEndEditing function. ScrollPoint when done ending UItextView
    func textViewDidEndEditing(_ textField:UITextView){
        
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    
    // 9) Modify existing viewDidLoad function. Default Function to load when view is shown
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        //Adds tap gesture to ScrollView which will call DismissKeyboard and hide keyboard
        ScrollView.addGestureRecognizer(tap)
        //gets ScreenSize of current device
        let size: CGRect = UIScreen.main.bounds
        //Go to left  = 0 pixels, top = 50 pixels, width or device in pixels, height of device in pixels
        ScrollView.frame = CGRect(x:0, y:50, width:size.width, height:size.height)
        //Set focus on txtFirst
        txtFirst.becomeFirstResponder()

    }
    
    
    
    // 10) Default didReceiveMemoryWarning Function to dispose of memory automatically.Leave this function alone
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    
    
    
    
    

}

