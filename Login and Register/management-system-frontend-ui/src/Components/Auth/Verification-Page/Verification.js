import React, { useState } from "react";
import axios from "axios";
import { useLocation, useNavigate } from "react-router-dom";
import { useRef } from "react";



function Verification() {
    const location = useLocation();
    const navigate = useNavigate();
    const  email  = location.state.email;

    const [otp, setOtp] = useState(new Array(6).fill(""));
    const otpRef =  useRef([]); 


    function handleChange(e, index) {
        if (isNaN(e.target.value)) return false;

        let newArray = [...otp];
        newArray[index] = e.target.value;
        setOtp(newArray);

        if(e.target.value && index < 6-1)
        {
            otpRef.current[index + 1].focus();
        }
    }

    function handleKeyPress(e,index){
        if(e.key === 'Backspace' && !e.target.value && index > 0){
            otpRef.current[index-1].focus();
        }
    }

    const sendotp = Number(otp.join(''));
    const VerifyPayload = { email, otp  : sendotp };
    
    function verifyUser() {
        console.log(VerifyPayload);
        console.log(typeof(sendotp));
        axios.put('http://localhost:5251/api/Auth/verifyuser', VerifyPayload)
            .then(
                (response) => {
                    navigate('/login');
                    console.log("Verified Successfully", response);
                },
                (error) => {
                     console.log(error);
                 }
             );
    }

    return (
        <>


            <div >
                <div>
                    <img  alt="logo"  />

                    <h1>Verification Page</h1>

                    <h1>Otp Sent to this E-Mail<span><strong>({email})</strong></span></h1>
                </div>
            </div>
            <div>
                <div>
                    <label htmlFor="OTP"></label>
                    <div>
                        {
                            otp.map((data, index) => {
                                return (
                                    <input
                                        key={index} // Unique key applied to input
                                        ref={(input) => { otpRef.current[index] = input }}
                                        type="text"
                                        id="OTP"
                                        name="otp"
                                        value={data}
                                        maxLength={1}
                                        onChange={(e) => handleChange(e, index)}
                                        onKeyDown={(e => {handleKeyPress(e,index)})}
                                    />
                                );
                            })
                        }
                    </div>
                    <button type="submit" onClick={verifyUser}>Verify</button>
                </div>
            </div>    
        </>
    );
}

export default Verification;
