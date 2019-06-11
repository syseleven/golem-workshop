const express = require('express');
const randomQuote = require('random-quote');
const promBundle = require("express-prom-bundle");

const app = express();
const metricsMiddleware = promBundle({includeMethod: true});
const Prometheus = metricsMiddleware.promClient;
const quotesTotal = new Prometheus.Counter({
  name: 'quote_fetches_total',
  help: 'Total number of quotes',
  labelNames: []
});
app.use(metricsMiddleware);

app.get('/health', (req, res) => {
    res.sendStatus(200);
});

app.get('/quote', (req, res) => {
    randomQuote()
        .then(quote => {
          quotesTotal.inc();
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
