<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

$routes->get('/', 'Auth::index');
$routes->get('/login', 'Auth::index');
$routes->post('/auth', 'Auth::auth');
$routes->get('/dashboard', 'Dashboard::index');
$routes->get('/logout', 'Auth::logout');

// User Acounts routes
$routes->get('/users', 'Users::index');
$routes->post('users/save', 'Users::save');
$routes->get('users/edit/(:segment)', 'Users::edit/$1');
$routes->post('users/update', 'Users::update');
$routes->delete('users/delete/(:num)', 'Users::delete/$1');
$routes->post('users/fetchRecords', 'Users::fetchRecords');

// Records routes
$routes->get('/record', 'Record::index');
$routes->post('record/save', 'Record::save');
$routes->get('record/edit/(:segment)', 'Record::edit/$1');
$routes->post('record/update', 'Record::update');
$routes->delete('record/delete/(:num)', 'Record::delete/$1');
$routes->post('record/fetchRecords', 'Record::fetchRecords');

// Parent/Guardian routes
$routes->get('/guardian', 'Guardian::index');
$routes->post('guardian/save', 'Guardian::save');
$routes->get('guardian/edit/(:segment)', 'Guardian::edit/$1');
$routes->post('guardian/update', 'Guardian::update');
$routes->delete('guardian/delete/(:num)', 'Guardian::delete/$1');
$routes->post('guardian/fetchRecords', 'Guardian::fetchRecords');


// Logs routes for admin
$routes->get('/log', 'Logs::log');