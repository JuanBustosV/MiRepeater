'use strict'

function EliminarClick(obj) {
    console.log(obj);
}

function EditarClick(obj) {
    console.log(obj, typeof obj);
    console.log(getRowId(obj));
}

function getRowId(str) {
    return str.split('_')[1];
}