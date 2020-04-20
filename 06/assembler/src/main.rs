use std::path::{Path, PathBuf};
use std::env;
use std::fs::read_to_string;
use std::io;

fn main() -> Result<(), io::Error> {
    let args = env::args().collect::<Vec<String>>();
    let input_asm = load_asm(&args[1])?;

    println!("{}", input_asm);

    let asm_stmts = parse(&input_asm);
    let hack_stmts = assemble(asm_stmts);
    let output = output(hack_stmts);

    println!("{}", output);

    Ok(())
}

pub struct ASMStmt {}

pub struct HackStmt {}

impl HackStmt {
    pub fn as_string(&self) -> String {
        "".to_string()
    }
}

fn load_asm<P: AsRef<Path>>(path: P) -> Result<String, io::Error> {
    read_to_string(path)
}

fn parse(input: &str) -> Vec<ASMStmt> {
    // noop
    Vec::new()
}

fn assemble(lines: Vec<ASMStmt>) -> Vec<HackStmt> {
    // noop
    Vec::new()
}

fn output(lines: Vec<HackStmt>) -> String {
    lines.iter().map(|s| s.as_string()).collect::<Vec<String>>().join("\n")
}

#[cfg(test)]
mod test {
    use super::*;

    fn load_hack<P: AsRef<Path>>(path: P) -> Result<String, io::Error> {
        read_to_string(path)
    }

    #[test]
    fn test_max() {
        let input_asm = load_asm("./test/input/Max.asm").unwrap();
        println!("input:\n{}", input_asm);

        let asm_lines = parse(&input_asm);
        let hack_lines = assemble(asm_lines);
        
        let output_hack = output(hack_lines);
        println!("output:\n{}", output_hack);

        let expected_output = load_hack("./test/output/Max.hack").unwrap();
        println!("expected:\n{}", expected_output);

        assert!(output_hack == expected_output);
    }
}