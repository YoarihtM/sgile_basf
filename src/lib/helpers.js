const helpers = {};
const bcrypt = require('bcryptjs')

helpers.encryptPassword = async (password) => {
    const salt = await bcrypt.genSalt(10);
    const realPassword = await bcrypt.hash(password, salt);
    return realPassword;
};

helpers.matchPassword = async (password, savedPassword) => {

    try {
        return await bcrypt.compare(password, savedPassword);
    } catch (error) {
        console.log(error);
    }

};

helpers.createPassword = () => {

    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSUVWXYZ!@#$%^&*()_+=[{]}|:;",<.>?/';
    const passwordLength = 16;

    const index = () =>  Math.floor(Math.random() * (letters.length - 0));

    let newPassword = '';

    for (let i = 0; i < passwordLength; i++){ 
        newPassword += letters[index()];
    }

    return newPassword;

};

module.exports = helpers;