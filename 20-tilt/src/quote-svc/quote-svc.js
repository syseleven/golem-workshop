const express = require('express');
const stoicapi = require("stoic-api");

const app = express();

app.get('/health', (req, res) => {
    res.sendStatus(200);
});

app.get('/quote', (req, res) => {
    const quote = {
        title: 'This is a random quote',
        description: stoicapi.random(),
    };
    quote.title = quote.title.toUpperCase();
    res.send([quote]);
});

const port = 3000;

const server = app.listen(port, () => console.log(`quote svc listening on port ${port}!`));

process.on('SIGTERM', function () {
    server.close(function () {
        process.exit(0);
    });
});
