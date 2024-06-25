function receiveChatFromAPI() {
	const response = await fetch('https://www.chatbase.co/api/v1/chat', {
	  method: 'POST',
	  headers: {
	    Authorization: 'Bearer <API-Key>'
	  },
	  body: JSON.stringify({
	    messages: [
	      { content: 'How can I help you?', role: 'assistant' },
	      { content: 'What is chatbase?', role: 'user' }
	    ],
	    chatbotId: 'NfqOA3dRdfUfWcAiPIkof',
	    stream: false,
	    model: 'gpt-3.5-turbo',
	    temperature: 0
	  })
	});
	
	if (!response.ok) {
	  const errorData = await response.json();
	  throw Error(errorData.message);
	}
	const data = await response.json(); 
	console.log(data); // { "text": "..."}
}