import{_ as l,r as c,j as a,a as s,n as p}from"./app-5b5926fe.js";import{G as u}from"./GuestLayout-367da30f.js";import{T as f,I as w}from"./TextInput-6493e94a.js";import{I as h}from"./InputLabel-eca1de45.js";import{P as g}from"./PrimaryButton-2fd30ffd.js";import"./ApplicationLogo-46f84236.js";function I(){const{data:e,setData:t,post:o,processing:m,errors:n,reset:i}=l({password:""});c.useEffect(()=>()=>{i("password")},[]);const d=r=>{t(r.target.name,r.target.value)};return a(u,{children:[s(p,{title:"Confirm Password"}),s("div",{className:"mb-4 text-sm text-gray-600 dark:text-gray-400",children:"This is a secure area of the application. Please confirm your password before continuing."}),a("form",{onSubmit:r=>{r.preventDefault(),o(route("password.confirm"))},children:[a("div",{className:"mt-4",children:[s(h,{htmlFor:"password",value:"Password"}),s(f,{id:"password",type:"password",name:"password",value:e.password,className:"mt-1 block w-full",isFocused:!0,onChange:d}),s(w,{message:n.password,className:"mt-2"})]}),s("div",{className:"flex items-center justify-end mt-4",children:s(g,{className:"ml-4",disabled:m,children:"Confirm"})})]})]})}export{I as default};
