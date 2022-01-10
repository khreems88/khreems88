// This is my first code in React.js

function displayName(user) {
    return user.firstName + ' ' + user.lastName;
  }
  
  const user = {
    firstName: 'Kevin',
    lastName: 'Riemer',
  };
  
  const element = <h1>Hi, {displayName(user)}!</h1>;
  
  ReactDOM.render(element, document.getElementById('root'));