# Karate API Testing Framework for Automation Exercise

This project demonstrates comprehensive API testing using the Karate framework for the [Automation Exercise API](https://automationexercise.com/api_list).

## Framework Features

### 🚀 **Core Karate Methods Demonstrated**
- **HTTP Methods**: GET, POST, PUT, DELETE requests
- **Response Validation**: Status codes, headers, response body
- **JSON Path Matching**: Complex object and array matching
- **Data-Driven Testing**: Scenario Outlines with Examples
- **Background Scenarios**: Reusable setup steps
- **API Chaining**: Using response data in subsequent requests
- **Schema Validation**: Comprehensive response structure validation
- **Negative Testing**: Invalid inputs and error handling
- **Performance Testing**: Response time validation

### 🛠️ **Advanced Features**
- **Gradle Build System**: Professional build configuration
- **Multiple Test Runners**: Organized test execution
- **Environment Configuration**: Multi-environment support
- **Test Data Management**: External JSON data files
- **Utility Functions**: Reusable JavaScript helpers
- **Comprehensive Reporting**: Built-in HTML reports
- **Parallel Execution**: Faster test execution

## Project Structure

```
├── build.gradle                          # Gradle build configuration
├── gradle/wrapper/                       # Gradle wrapper files
├── src/test/
│   ├── java/runner/
│   │   └── TestRunner.java              # JUnit 5 test runners
│   └── resources/
│       ├── karate-config.js             # Global configuration
│       └── karate/
│           ├── features/
│           │   ├── products/            # Product API tests
│           │   │   └── products.feature
│           │   ├── users/               # User management tests
│           │   │   └── users.feature
│           │   ├── brands/              # Brand API tests
│           │   │   └── brands.feature
│           │   └── search/              # Search API tests
│           │       └── search.feature
│           ├── data/
│           │   └── test-data.json       # Test data
│           └── utils/
│               └── helpers.js           # Utility functions
└── README.md
```

## API Endpoints Covered

### Products API
- `GET /api/productsList` - Get all products
- `POST /api/productsList` - Test method not allowed
- Product structure validation
- Product data integrity checks

### Users API
- `POST /api/createAccount` - Create new user
- `POST /api/verifyLogin` - User login verification
- `GET /api/getUserDetailByEmail` - Get user details
- `DELETE /api/deleteAccount` - Delete user account

### Brands API
- `GET /api/brandsList` - Get all brands
- `PUT /api/brandsList` - Test method not allowed
- Brand data validation
- Performance testing

### Search API
- `POST /api/searchProduct` - Search products
- Various search scenarios
- Edge case testing

## Karate Methods Demonstrated

### 1. **Basic HTTP Operations**
```gherkin
Given path '/productsList'
When method GET
Then status 200
```

### 2. **Response Matching**
```gherkin
And match response.responseCode == 200
And match response.products == '#array'
And match response.products[0] contains { id: '#number', name: '#string' }
```

### 3. **Form Data Handling**
```gherkin
And form field name = 'Test User'
And form field email = 'test@example.com'
And form field password = 'testpass123'
```

### 4. **Data-Driven Testing**
```gherkin
Scenario Outline: Test with multiple data sets
  Given path '/searchProduct'
  And form field search_product = '<searchTerm>'
  When method POST
  Then status 200
  
  Examples:
    | searchTerm |
    | top        |
    | tshirt     |
    | jeans      |
```

### 5. **API Chaining**
```gherkin
* def products = response.products
* def firstProduct = products[0]
And match firstProduct.id == '#number'
```

### 6. **Schema Validation**
```gherkin
* def expectedSchema = 
  """
  {
    "responseCode": "#number",
    "products": "#[] #object"
  }
  """
And match response == expectedSchema
```

### 7. **Negative Testing**
```gherkin
Given path '/invalidEndpoint'
When method GET
Then status 404
```

### 8. **Background Scenarios**
```gherkin
Background:
  * url baseUrl
  * configure timeout = 30000
```

## Getting Started

### Prerequisites
- Java 11 or higher
- Gradle 8.5 or higher

### Running Tests

1. **Run all tests:**
```bash
./gradlew test
```

2. **Run specific test suites:**
```bash
./gradlew test -Dkarate.options="--tags @smoke"
./gradlew test -Dkarate.options="--tags @regression"
```

3. **Run with different environments:**
```bash
./gradlew test -Dkarate.env=staging
```

4. **Run specific feature files:**
```bash
./gradlew test -Dkarate.options="classpath:karate/features/products"
```

### Test Tags Available
- `@smoke` - Critical functionality tests
- `@regression` - Comprehensive regression tests
- `@negative` - Error handling tests
- `@data-driven` - Data-driven test scenarios
- `@api-chaining` - API workflow tests
- `@performance` - Performance validation tests

## Configuration

### Environment Configuration
The framework supports multiple environments through `karate-config.js`:
- **dev** - Development environment
- **staging** - Staging environment  
- **prod** - Production environment

### Test Data Management
Test data is externalized in `test-data.json` for:
- User account information
- Search terms
- Expected product data
- Brand information

## Reports

After test execution, reports are generated in:
- `build/test-results/test/` - JUnit XML reports
- `build/reports/tests/test/` - HTML reports
- Console output with detailed logs

## Advanced Features

### Utility Functions
JavaScript utility functions in `helpers.js`:
- `getRandomEmail()` - Generate unique emails
- `getRandomUser()` - Generate test user data
- `validateProductStructure()` - Validate product objects
- `getUniqueArray()` - Remove duplicates from arrays

### Retry Configuration
Built-in retry mechanism for flaky tests:
```javascript
configure retry = { count: 3, interval: 1000 }
```

### Performance Monitoring
Response time validation:
```gherkin
And assert responseTime < 5000
```

## Best Practices Implemented

1. **Modular Test Structure** - Feature files organized by functionality
2. **Reusable Components** - Background scenarios and utility functions
3. **Data Externalization** - Test data in JSON files
4. **Comprehensive Validation** - Response, schema, and data validation
5. **Error Handling** - Negative test scenarios
6. **Performance Testing** - Response time assertions
7. **Parallel Execution** - Multiple test runners for faster execution

## Contributing

1. Add new feature files in appropriate directories
2. Follow the existing naming conventions
3. Include both positive and negative test scenarios
4. Add appropriate tags for test categorization
5. Update test data files as needed
6. Include comprehensive assertions

This framework provides a solid foundation for API testing with Karate, demonstrating industry best practices and comprehensive testing strategies.