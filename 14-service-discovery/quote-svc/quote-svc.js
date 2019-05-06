const express = require('express');
const randomQuote = require('random-quote');

const app = express();

app.get('/health', (req, res) => {
    res.sendStatus(200);
});

app.get('/quote', (req, res) => {
    randomQuote()
        .then(quote => {
            quote[0].title = quote[0].title.toUpperCase();
            res.send(quote);
        })
        .catch(err => res.send(err));
});

const port = 3000;

const server = app.listen(port, () => console.log(`quote svc listening on port ${port}!`));

process.on('SIGTERM', function () {
    server.close(function () {
        process.exit(0);
    });
});
