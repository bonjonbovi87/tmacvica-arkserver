const express = require('express');
const { exec } = require('child_process');
const app = express();
const port = 3000;

function runCommand(command, res) {
  command = `/home/arkserver/arkserver ${command}`;
  exec(command, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error.message}`);
      return res.status(500).send(`Command failed: ${error.message}`);
    }
    if (stderr) {
      console.warn(`Stderr: ${stderr}`);
    }
    res.send(`Command executed:\n${stdout}`);
  });
}

app.get('/ark/start', (req, res) => {
  runCommand('start', res);
});

app.get('/ark/restart', (req, res) => {
  runCommand('restart', res);
});

app.get('/ark/stop', (req, res) => {
  runCommand('stop', res);
});

app.listen(port, '10.0.0.47', () => {
  console.log(`tmacvica-arkserver listening at http://localhost:${port}`);
});

