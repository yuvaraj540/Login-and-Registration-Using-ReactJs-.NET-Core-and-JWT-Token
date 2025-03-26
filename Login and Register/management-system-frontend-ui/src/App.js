import { BrowserRouter,Routes,Route } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import Landing from "./Components/Pages/Landing/Landing"; 
import Login from "./Components/Auth/Login-Page/Login"; 
import Registration from "./Components/Auth/Registration-Page/Registration";
import Verification from "./Components/Auth/Verification-Page/Verification";
import Sendotp from "./Components/Auth/Verification-Page/Sendotp";
import Dashboard from "./Components/Pages/profile/dashboard";


function App() {
  return (
    <div className="App">
      <BrowserRouter>
            <Routes>
                <Route path='/' element={ <Landing />} />
                <Route path='/login' element= { <Login /> } />
                <Route path='/register' element = { <Registration /> } />
                <Route  path="/sentotp" element={<Sendotp/>}/>
                <Route path='/verification' element = { <Verification /> }/>
                <Route path='/dashboard' element = { <Dashboard /> }/>
            </Routes>
        </BrowserRouter>
    </div>
  );
}

export default App;















{/* <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header> */}