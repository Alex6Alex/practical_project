import React from 'react';

export default class HomePageComponent extends React.Component {
  componentDidMount() {
    document.title = 'Test';
  }

  render() {
    return(
      <div className='home_page'>
        <h1>Test App | Home!!!</h1>
      </div>
    )
  }
}
