import logo from './logo.svg';
import './App.css';
import { useState, useEffect } from 'react';

function App() {
  const [count, setCount] = useState();

  useEffect(() => {
    async function fetchCount() {
      try {
        const response = await fetch('/api/count');
        if (response.ok) {
          setCount(await response.json());
        }
      } catch (e) {
        console.log(e);
      }
    }
    fetchCount();
  }, []);

  return (
    <div className="App">

          <h1>O_food</h1>


        <p>
          Nbre visites d' O_Food : { count }
        </p>

    </div>
  );
}

export default App;