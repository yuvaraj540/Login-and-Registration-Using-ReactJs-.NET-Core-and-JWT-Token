import axios from "axios";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

function Login() {
  const [LoginPayload, setLoginPayload] = useState({});
  const navigate = useNavigate();

  function handlechange(e) {
    const key = e.target.name;
    const value = e.target.value;

    setLoginPayload((previousState) => {
      return { ...previousState, [key]: value };
    });
  }

  function handlelogin(e) {
    e.preventDefault();
    console.log(LoginPayload);
    axios.post('http://localhost:5251/api/Auth/login', LoginPayload)
      .then((response) => {
        console.log(response.data.token);
        localStorage.setItem("AuthToken",response.data.token);
        navigate('/dashboard');
      },
      (error) => {
        console.log(error);
      });
  }

  return (
    <>
      <div className="container d-flex justify-content-center align-items-center" style={{ minHeight: '100vh' }}>

        <div className="card shadow-lg p-4" style={{ width: '100%', maxWidth: '400px' }}>

          <h2 className="text-center mb-4">Login</h2>

          <form onSubmit={handlelogin}>

            <div className="mb-3">
              <label htmlFor="Username" className="form-label">Username</label>
              <input type="text" id="Username" name="username" className="form-control" onChange={handlechange} placeholder="Enter Your Username..." required />
            </div>

            <div className="mb-3">
              <label htmlFor="Password" className="form-label">Password</label>
              <input type="password" id="Password" name="password" className="form-control" placeholder="Enter Your Password..." onChange={handlechange} required />
            </div>

            <div className="form-check mb-3">
              <input type="checkbox" className="form-check-input" id="rememberMe" />
              <label className="form-check-label" htmlFor="rememberMe">Remember Me</label>
            </div>

            <div className="d-grid gap-2">
              <button type="submit" className="btn btn-primary">Login</button>
            </div>
            
          </form>

        </div>

      </div>
    </>
  );
}

export default Login;
