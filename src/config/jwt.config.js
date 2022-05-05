const env = require(`../env/${process.env.NODE_ENV}`)

const usersDataMapper = require('../database/models/users.datamapper');
const APIError = require('../Errors/APIError');

const secret = `${env.JWT_SECRET}`;
const jwt = require('jsonwebtoken');
const { app } = require('../index');

// à adapter 

const createJwtToken = ({ user = null, id = null }) => {
  const jwtToken = jwt.sign({ 
    sub: id || user.id,
    exp: Math.floor(Date.now() / 1000) + 5 
  }, secret);
  return jwtToken;
}


exports.createJwtToken = createJwtToken;


//Ici c'est un middleware
const extractUserFromToken = async (req, res, next) => {
  const token = req.cookies.jwt;
  if (token) {
    try {

      //verif et décodage (recup du contenu du payload)
      let decodedToken = jwt.verify(token, secret, { ignoreExpiration: true });
      decodedToken = checkExpirationToken(decodedToken, res);


      const user = await usersDataMapper.findUserPerId(decodedToken.sub);

      if (user) {
        //ici on place le user sur une clé user de l'objet req, pour le rendre dispo sur les middleware suivant
        req.user = user;
        next();
      } else {
        //si on a pas trouvé de user correspand à cet id en bdd 
        res.clearCookie('jwt');
        //res.redirect('/');
      }
    } catch(e) {
      //si il y a une erreur on delete le cookie
      res.clearCookie('jwt');
      //res.redirect('/');
    }
  } else {
    next();
  }
}

const checkExpirationToken = (token, res) => {
  const tokenExp = token.exp;
  const nowInSec = Math.floor(Date.now() / 1000);
  if (nowInSec <= tokenExp) {
    return token
  } else if (nowInSec > tokenExp && ((nowInSec - tokenExp) < 60 * 60 * 24) ) {
    const refreshedToken = createJwtToken({ id: token.sub });
    res.cookie('jwt', refreshedToken);
    return jwt.verify(refreshedToken, secret)
  } else {
    throw new Error('token expired');
  }
}

//Ici c'est un middleware
const addJwtFeatures = (req, res, next) => {
  req.isAuthenticated = () => !!req.user; //retourne true ou false // à expliquer pout tout le monde
  req.logout = () => res.clearCookie('jwt')
  req.login = (user) => {
    const token = createJwtToken({ user });
    res.cookie('jwt', token);
  }
  next();
}

//"application des middlewares"
app.use(extractUserFromToken);
app.use(addJwtFeatures);