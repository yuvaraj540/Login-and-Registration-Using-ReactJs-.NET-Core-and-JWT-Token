import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import brandlogo from '../../../Assets/images/logo-color.png';
import instalogo from '../../../Assets/fonts/skill-icons--instagram.png';
import googlelogo from '../../../Assets/fonts/flat-color-icons--google.png';
import fblogo from '../../../Assets/fonts/logos--facebook.png';

function Registration() {
    const [RegisterPayload, setRegisterPayload] = useState({});
    const navigate = useNavigate();

    function handleinputfield(e) {
        const key = e.target.name;
        const value = e.target.value;
        setRegisterPayload((previousState) => {
            return { ...previousState, [key]: value };
        });
    }

    function handleregister(e) {
        e.preventDefault();
        console.log(RegisterPayload);
        axios
            .post('http://localhost:5251/api/Auth/register', RegisterPayload)
            .then((response) => {
                console.log(response);
                setRegisterPayload({});

                // Directly destructure properties from the response
                const { id, userName, email } = response.data;
                console.log(id, userName, email);

                // Use the destructured values for navigation
                navigate(`/sentotp`, { state: { id, userName, email } });
            })
            .catch((error) => {
                console.log(error);
            });
    }

    return (
        <div className="container-fluid">
            <div className="row">
                {/* Left Block */}
                <div className="col-lg-6 d-flex align-items-center justify-content-center p-5 bg-primary text-white">
                    <div className="text-center">
                        <img src={brandlogo} alt="logo" className="img-fluid mb-3" style={{ maxWidth: '200px' }} />
                        <h1>Welcome to Management System</h1>
                        <p className="lead">Sign Up to Explore</p>
                    </div>
                </div>

                {/* Right Block */}
                <div className="col-lg-6 d-flex align-items-center justify-content-center p-5">
                    <form onSubmit={handleregister} className="w-100">
                        <fieldset>
                            <legend className="mb-4">Registration</legend>

                            {/* Username */}
                            <div className="mb-3">
                                <label htmlFor="Username" className="form-label">Username</label>
                                <input
                                    className="form-control"
                                    type="text"
                                    id="Username"
                                    name="userName"
                                    onChange={handleinputfield}
                                    placeholder="Enter Your Username"
                                    required
                                />
                            </div>

                            {/* Password */}
                            <div className="mb-3">
                                <label htmlFor="Password" className="form-label">Password</label>
                                <input
                                    className="form-control"
                                    type="password"
                                    id="Password"
                                    name="password"
                                    onChange={handleinputfield}
                                    placeholder="Enter Your Password"
                                    required
                                />
                            </div>

                            {/* Email */}
                            <div className="mb-3">
                                <label htmlFor="E-Mail" className="form-label">E-Mail</label>
                                <input
                                    className="form-control"
                                    type="email"
                                    id="E-Mail"
                                    name="email"
                                    onChange={handleinputfield}
                                    placeholder="Enter Your E-Mail"
                                    required
                                />
                            </div>

                            {/* Phone Number */}
                            <div className="mb-3">
                                <label htmlFor="Phone Number" className="form-label">Phone Number</label>
                                <input
                                    className="form-control"
                                    type="tel"
                                    id="Phone Number"
                                    name="phoneNumber"
                                    onChange={handleinputfield}
                                    placeholder="Enter Your Phone Number"
                                    required
                                />
                            </div>

                            {/* Gender */}
                            <div className="mb-3">
                                <label htmlFor="Gender" className="form-label">Gender</label>
                                <select
                                    className="form-select"
                                    id="Gender"
                                    name="gender"
                                    onChange={handleinputfield}
                                    required
                                >
                                    <option value="">---Select Option---</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>

                            {/* Date of Birth */}
                            <div className="mb-3">
                                <label htmlFor="DOB" className="form-label">Date of Birth</label>
                                <input
                                    className="form-control"
                                    type="date"
                                    id="DOB"
                                    name="dob"
                                    onChange={handleinputfield}
                                    required
                                />
                            </div>

                            {/* Terms and Conditions */}
                            <div className="form-check mb-3">
                                <input
                                    className="form-check-input"
                                    type="checkbox"
                                    id="Terms"
                                    name="terms"
                                    required
                                />
                                <label htmlFor="Terms" className="form-check-label">
                                    I agree to the <a href="https://drive.google.com/file/d/1mUlCQHfTLlGbPOeE48zYQLzzZJqeNwAl/view?usp=drivesdk" target="_blank" rel="noopener noreferrer">Terms and conditions</a>.
                                </label>
                            </div>

                            {/* Submit Button */}
                            <button className="btn btn-primary w-100" type="submit">Register</button>

                            {/* Login Link */}
                            <p className="mt-3 text-center">
                                Already Have an Account? <Link to="/login">Login here...</Link>
                            </p>

                            {/* Social Media Sign-In */}
                            <hr />
                            <div className="d-flex justify-content-center">
                                <a href="#" className="mx-2">
                                    <img src={googlelogo} alt="Google" className="img-fluid" style={{ width: '40px' }} />
                                </a>
                                <a href="#" className="mx-2">
                                    <img src={fblogo} alt="Facebook" className="img-fluid" style={{ width: '40px' }} />
                                </a>
                                <a href="#" className="mx-2">
                                    <img src={instalogo} alt="Instagram" className="img-fluid" style={{ width: '40px' }} />
                                </a>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default Registration;
