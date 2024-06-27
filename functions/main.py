# The Cloud Functions for Firebase SDK to create Cloud Functions and set up triggers.
from firebase_functions import firestore_fn, https_fn

# The Firebase Admin SDK to access Cloud Firestore.
from firebase_admin import initialize_app, messaging

app = initialize_app()

# Cloud Firestore triggers ref: https://firebase.google.com/docs/functions/firestore-events?gen=2nd#python-preview
@firestore_fn.on_document_created(document="chat/{messageId}")
def firestore_event_handler(event):

    if event.data is None:
        return

    username = event.data.get("username")
    text = event.data.get("text")
    
    # Create the notification message
    message = messaging.Message(
        notification=messaging.Notification(
            title=username,
            body=text,
        ),
        data={
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        },
        topic='chat',
    )
    
    # Send the notification
    response = messaging.send(message)
    print('Successfully sent message:', response)
