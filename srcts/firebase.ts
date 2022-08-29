import { GoogleAuthProvider, getAuth } from "firebase/auth";
import { initializeApp } from "firebase/app";

import dotenv from "dotenv";

dotenv.config();

const app = initializeApp({
  apiKey: process.env.FIREBASE_API_KEY,
  authDomain: "quartolive.firebaseapp.com",
});

const provider = new GoogleAuthProvider();
provider.setCustomParameters({
  login_hint: "user@example.com",
});
provider.addScope("https://www.googleapis.com/auth/drive");

const auth = getAuth(app);

export const signIn = () => {};
