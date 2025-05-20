const express = require('express');
const { exec } = require('child_process');
const app = express();
const port = 7776;

function log(message){
  const timestamp = new Date().toISOString();
  console.log(`${timestamp} - ${message}`);
}

function formatRet(ret){
  return ret.replace("\n", "<br />");
}

function runCommand(command, res) {
  command = `/home/arkserver/arkserver ${command}`;
  log(command)
  exec(command, (error, stdout, stderr) => {
    if (error) {
      log(`Error: ${error.message}\n${stdout}`);
      return res.status(500).send(`Command executed: ${formatRet(stdout)}`);
    }
    if (stderr) {
      log(`Stderr: ${stderr}`);
    }
    log(stdout);	  
    res.send(`Command executed: ${formatRet(stdout)}`);
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

app.listen(port, '0.0.0.0', () => {
  log(`tmacvica-arkserver listening :${port}`);
});

