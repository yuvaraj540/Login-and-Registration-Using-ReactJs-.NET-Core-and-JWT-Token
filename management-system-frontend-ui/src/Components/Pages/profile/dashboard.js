import React from "react";
import { useNavigate } from "react-router-dom";

function Dashboard() {
  const navigate = useNavigate();

  // Sample user data (you could fetch this from an API or localStorage)
  const user = {
    name: "John Doe",
    email: "johndoe@example.com",
  };

  // Logout function
  function logOut() {
    localStorage.removeItem("AuthToken");
    navigate("/"); // Redirect to home page after logout
  }

  return (
    <div>
      {/* Dashboard Header */}
      <div className="d-flex justify-content-between align-items-center bg-primary text-white p-3">
        <div>
          <h2 className="m-0">Dashboard</h2>
        </div>
        <div>
          <button
            className="btn btn-outline-light"
            onClick={logOut}
          >
            Log Out
          </button>
        </div>
      </div>

      {/* Dashboard Content */}
      <div className="container mt-5">
        <div className="card shadow-sm">
          <div className="card-header bg-light">
            <h5 className="card-title mb-0">User Information</h5>
          </div>
          <div className="card-body">
            <p><strong>Name:</strong> {user.name}</p>
            <p><strong>Email:</strong> {user.email}</p>
          </div>
        </div>

        {/* Additional Dashboard Content (optional) */}
        <div className="mt-4">
          <h3>Dashboard Features</h3>
          <p>Here you can add more content or features for the user, like analytics, settings, etc.</p>
        </div>
      </div>
    </div>
  );
}

export default Dashboard;
