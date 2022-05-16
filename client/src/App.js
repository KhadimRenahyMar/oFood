import logo from './logo.svg';
import './App.css';
import { useState, useEffect } from 'react';

function App() {
  const [Msg, SetfetchMsg] = useState();

  //const FETCH_URL = 'http://localhost:3001/api/users/login'

  useEffect(() => {
    async function fetchMsg() {
      try {
        
        const response = await fetch('api/users/login', {
          method: "POST",
          body: JSON.stringify({
            
            "email": "test1",
            "password":"test1"
            
          }),
          headers: {
            'Content-Type': 'application/json'
          }
        });
        
        if (response.ok) {
          
            SetfetchMsg(await response.json());
            
        } 


      } catch (e) {
        console.log(e);
      }
    }
    fetchMsg();
  }, []);

  return (
    <div className="App">

          <h1>O_food</h1>


        <p>
          Msg du Back : { Msg }
        </p>

    </div>
  );
}

export default App;



