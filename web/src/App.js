import React, { Component} from "react";
import "./App.css";
import img from "./images/pic.jpg"

class App extends Component{
  render(){
    // console.log(process.env.API_URL)
    // console.log(process.env.WEB_PORT)
    return(
      <div className="App">
        <h1> Hello, Universe!! </h1>
        <img src={img} />
      </div>
    );
  }
}

export default App;