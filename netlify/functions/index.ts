import { Handler } from "@netlify/functions";

const headers = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'Content-Type',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE'
};

const handler: Handler = async (event, context) => {
  console.log(event.body)

  .then(() => {
    console.log('Email sent')
    return {
      statusCode: 200,
      headers,
      body: JSON.stringify({ message: "Email sent!" }),
    }
  })
  .catch((error) => {
    console.error(error)
    return {
      statusCode: 500,
      headers,
      body: JSON.stringify({ message: error }),
    }
  })
};

export { handler };
