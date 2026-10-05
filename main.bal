import ballerinax/ai.wso2.integration as voice;
import ballerina/log;

listener voice:CloudVoiceListener voiceListener = new (9091);

isolated service voice:VoiceService on voiceListener {
    isolated remote function onChatMessage(voice:ChatMessage message) returns string|error {
        log:printInfo("Message: ", input = message);
        string response = check mathTutorAgent.run(message.message, message.sessionId);
        log:printInfo("Response: ", output = response);
        return response;
    }
}
