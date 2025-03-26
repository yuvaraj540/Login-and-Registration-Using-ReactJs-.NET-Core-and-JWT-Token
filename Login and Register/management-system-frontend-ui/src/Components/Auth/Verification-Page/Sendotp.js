import axios from "axios";
import { useLocation, useNavigate } from "react-router-dom";

function Sendotp() {
    const location = useLocation();
    const navigate = useNavigate();

    const id = location.state.id;
    const namedata = location.state.userName;
    const email = location.state.email;
    const payload = { id, email };

    function verify() {
        axios.post("http://localhost:5251/api/Auth/sendingmail", payload)
            .then(
                (response) => {
                    console.log("Sended");
                    navigate('/verification', { state: { email } });
                },
                (error) => {
                    console.log("Error", error);
                }
            );
    }

    return (
        <>
            {/* Left Block - User Info Section */}
            <div className="d-flex justify-content-center align-items-center vh-100 bg-light p-4">
                <div className="text-center">
                    <img src="brandlogo.png" alt="logo" className="mb-4" style={{ width: "120px" }} />
                    <h1>Hello <span className="text-primary">{namedata}</span></h1>
                    <h4>Welcome to the Management System</h4>
                </div>
            </div>

            {/* Right Block - Button Section */}
            <div className="d-flex justify-content-center align-items-center vh-100 bg-white p-4">
                <div>
                    <button className="btn btn-primary" type="button" onClick={verify}>
                        Send Mail
                    </button>
                </div>
            </div>
        </>
    );
}

export default Sendotp;
