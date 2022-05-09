import logo from './logo.svg';
import './App.css';
import { useState, useEffect } from 'react';

function App() {
  const [Msg, SetfetchMsg] = useState();

  useEffect(() => {
    async function fetchMsg() {
      try {

        const response = await fetch('/api/message');
        if (response.ok) {
          console.log(response);
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