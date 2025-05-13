import { useNavigate } from "react-router-dom";
import brandlogo from '../../../Assets/images/logo-color.png';

function Landing() {
  const navigate = useNavigate();

  function goLogin() {
    navigate('/login');
  }

  function goRegister() {
    navigate('/register');
  }

  

  return (
    <div className="container text-center py-5">
      {/* Logo */}
      <div className="mb-4">
        <img 
          src={brandlogo}
          alt="Logo" 
          className="img-fluid"
          style={{ maxWidth: '200px' }} // Adjust size of your logo
        />
      </div>

      {/* Header */}
      <h1 className="display-4 text-success mb-4">Welcome to Our Website</h1>
      <p className="lead text-muted mb-5">Your one-stop solution for all your needs. Let's get started!</p>

      {/* Action buttons */}
      <div className="d-flex justify-content-center gap-4 mb-4">
        <button className="btn btn-primary btn-lg" onClick={goLogin}>Login</button>
        <button className="btn btn-danger btn-lg" onClick={goRegister}>Register</button>
      </div>

      

      {/* Optional section */}
      <footer className="mt-5">
        <p className="text-muted">© 2024 Your Company. All rights reserved.</p>
      </footer>
    </div>
  );
}

export default Landing;
