# Contributing to Ethical Port Scanner

Thank you for your interest in contributing to this educational security tool! This guide will help you get started.

## Code of Conduct

This project is committed to providing a welcoming and inclusive experience for all contributors. Please be respectful and constructive in all interactions.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/not-a-chance.git`
3. Create a feature branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test your changes
6. Submit a pull request

## Development Setup

### Prerequisites
- Linux environment (Ubuntu recommended)
- Bash shell
- nmap installed (`sudo apt-get install nmap`)

### Testing Your Changes
```bash
# Make scripts executable
chmod +x *.sh

# Run the test script
./test_scanner.sh

# Test basic functionality
./port_scanner.sh --help
./port_scanner.sh 127.0.0.1
```

## Types of Contributions

### Bug Reports
When reporting bugs, please include:
- Operating system and version
- nmap version (`nmap --version`)
- Exact command that caused the issue
- Error message or unexpected behavior
- Steps to reproduce

### Feature Requests
For new features, please provide:
- Clear description of the feature
- Use case and justification
- Expected behavior
- Any relevant examples

### Code Changes
Please ensure your code:
- Follows existing code style
- Includes appropriate comments
- Handles errors gracefully
- Maintains ethical and legal compliance

## Coding Standards

### Shell Scripting Best Practices
- Use `#!/bin/bash` shebang
- Quote variables: `"$variable"`
- Use local variables in functions: `local var="value"`
- Check command exit codes
- Provide meaningful error messages
- Use descriptive function and variable names

### Security Considerations
- Always validate user input
- Include legal disclaimers for new features
- Ensure responsible disclosure practices
- Don't add features that could be easily misused
- Test with various target types (IP, domain, localhost)

## Vulnerability Database Updates

When adding new service-vulnerability mappings:

1. Verify the vulnerability information is accurate
2. Include CVE numbers when available
3. Focus on common, well-documented vulnerabilities
4. Provide educational context, not exploitation details
5. Update both the main script and documentation

Example format:
```bash
EXPLOITS[port]="Service - Brief description, Common vulnerability, Educational note"
```

## Documentation

- Update README.md for new features
- Add examples for new command-line options
- Update help text in the main script
- Include security implications

## Testing

### Required Tests
- Test help functionality: `./port_scanner.sh --help`
- Test invalid inputs (bad IPs, invalid ports)
- Test all scan types (quick, service, aggressive, stealth)
- Test various port range formats
- Verify error handling

### Manual Testing
- Test against localhost (127.0.0.1)
- Test with different port ranges
- Verify output formatting
- Check color output works correctly

## Pull Request Process

1. **Update Documentation**: Ensure README and help text are current
2. **Test Thoroughly**: Run all tests and verify functionality
3. **Clean Commits**: Use clear, descriptive commit messages
4. **No Breaking Changes**: Maintain backward compatibility
5. **Security Review**: Ensure changes maintain ethical standards

### Pull Request Template
```
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Testing
- [ ] Tested on localhost
- [ ] Tested help functionality
- [ ] Tested error handling
- [ ] Updated documentation

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No breaking changes introduced
```

## Legal and Ethical Guidelines

### Required for All Contributions
- Maintain focus on education and authorized testing
- Include appropriate legal disclaimers
- Don't add features primarily useful for malicious activities
- Ensure all contributions comply with applicable laws
- Follow responsible disclosure practices

### Prohibited Contributions
- Exploits or malicious payloads
- Features designed to bypass security measures
- Tools for unauthorized access
- Content that violates platform policies

## Recognition

Contributors will be recognized in:
- GitHub contributors list
- README.md acknowledgments
- Release notes for significant contributions

## Questions?

Feel free to:
- Open an issue for questions
- Start a discussion for feature ideas
- Reach out to maintainers

## Resources

- [nmap Documentation](https://nmap.org/docs.html)
- [Bash Scripting Guide](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
- [Ethical Hacking Guidelines](https://www.eccouncil.org/ethical-hacking/)

Thank you for contributing to ethical security education!
