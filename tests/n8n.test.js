const fs = require('fs');
const path = require('path');

describe('n8n workflows', () => {
  it('should be valid JSON files', () => {
    const dir = path.join(__dirname, '../n8n-workflows');
    const files = fs.readdirSync(dir).filter(f => f.endsWith('.json'));
    files.forEach(file => {
      const content = fs.readFileSync(path.join(dir, file), 'utf8');
      expect(() => JSON.parse(content)).not.toThrow();
    });
  });
});
