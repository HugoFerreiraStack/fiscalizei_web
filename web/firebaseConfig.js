function doSomething(){
    const firebaseConfig = {
        apiKey: "AIzaSyAiIfysEt4pvFfAWb0Z0Yxj5Pc-STPajds",
        authDomain: "fiscalizei-01.firebaseapp.com",
        projectId: "fiscalizei-01",
        storageBucket: "fiscalizei-01.appspot.com",
        messagingSenderId: "900161319985",
        appId: "1:900161319985:web:0dbc8bc892dbba7bc75110",
        measurementId: "G-5LKGDNGMLN"
      };
      firebase.initializeApp(firebaseConfig);
      firebase.analytics();
}
doSomething();