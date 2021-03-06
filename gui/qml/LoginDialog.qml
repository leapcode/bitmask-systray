import QtQuick 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.12

Dialog {
    title: qsTr("Login")
    standardButtons: Dialog.Ok

    Column {
        anchors.fill: parent
        Text {
            text: getLoginText()
            font.bold: true
        }
        Text {
            text: getDetailedText()
        }
        TextField {
            id: username
            //: Ask for the library card number
            placeholderText: qsTr("Patron ID")
        }
        TextField {
            id: password
            placeholderText: qsTr("Password")
            echoMode: TextInput.PasswordEchoOnEdit
            visible: !allowEmptyPass
        }
    }

    onAccepted: backend.login(username.text, password.text)
    onRejected: backend.quit()

    function getLoginText() {
        if (allowEmptyPass) {
            //: Ask for the library card number
            return qsTr("Enter your Patron ID")
        } else {
            return qsTr("Log in with your library credentials")
        }
    }

    function getDetailedText() {
        return qsTr("You can check your Patron ID number in the back of your library card")
    }
}
