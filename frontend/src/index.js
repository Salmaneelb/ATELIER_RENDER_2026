import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom/client";

function App() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch("https://URL_DE_TON_FLASK/info")
      .then(r => r.json())
      .then(setData);
  }, []);

  return (
    <div>
      <h1>Mon App React 🚀</h1>
      {data ? <pre>{JSON.stringify(data, null, 2)}</pre> : <p>Chargement...</p>}
    </div>
  );
}

ReactDOM.createRoot(document.getElementById("root")).render(<App />);
