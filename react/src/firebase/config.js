import { getAnalytics } from 'firebase/analytics';
import { initializeApp } from 'firebase/app';
import { getAuth } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';
const firebaseConfig = {
  apiKey: 'AIzaSyCVpzVM5OzcHGvJNioS8zkgYgWMQgYZDbg',
  authDomain: 'my-app-2cf3a.firebaseapp.com',
  projectId: 'my-app-2cf3a',
  storageBucket: 'my-app-2cf3a.appspot.com',
  messagingSenderId: '410778956131',
  appId: '1:410778956131:web:10a7673e68de824131e356',
  measurementId: 'G-03NNMCJFSV',
};

const app = initializeApp(firebaseConfig);
getAnalytics(app);
const db = getFirestore(app);
const auth = getAuth(app);
export { db, auth };
