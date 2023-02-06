<%@ Page Title="Milk And Berries - New Password" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="newPassword.aspx.cs" Inherits="newPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        html,
        .mainDiv {
          height: 100%;
        }

        .mainDiv {
          display: flex;
          align-items: center;
          padding-top: 40px;
          padding-bottom: 40px;
          background-color: #f5f5f5;
        }

        .form-signin {
          width: 100%;
          max-width: 330px;
          padding: 15px;
          margin: auto;
        }

        .form-signin .checkbox {
          font-weight: 400;
        }

        .form-signin .form-floating:focus-within {
          z-index: 2;
        }

        .form-signin input[type="email"] {
          margin-bottom: -1px;
          border-bottom-right-radius: 0;
          border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
          margin-bottom: 10px;
          border-top-left-radius: 0;
          border-top-right-radius: 0;
        }
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="text-center mainDiv">
    
    <main class="form-signin">
        <img class="mb-4" src="images/MB-Logo.svg" alt="" width="72" height="57">
        <h1 class="h3 mb-3 fw-normal">Please enter new password</h1>

        <div class="form-floating">
          <input type="password" class="form-control" id="floatingInput" placeholder="New-password">
          <label for="floatingInput">New password</label>
        </div>
        <div class="form-floating">
          <input type="password" class="form-control" id="floatingPassword" placeholder="Confirm password">
          <label for="floatingPassword">Confirm Password</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">Update</button>
    </main>

  </div>
</asp:Content>

