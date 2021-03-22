import React from 'react';

import { BrowserRouter, Switch, Route } from 'react-router-dom';
import { Provider } from 'react-redux';

import * as Components from './index';
import configureStore from '../stores/appStore';

export default class extends React.Component {
  render() {
    return (
      <Provider store={ configureStore() }>
        <BrowserRouter forceRefresh={true}>
            <Switch>
              <Route exact path='/' component={ Components.HomePageComponent } />
            </Switch>
        </BrowserRouter>
      </Provider>
    );
  }
}
