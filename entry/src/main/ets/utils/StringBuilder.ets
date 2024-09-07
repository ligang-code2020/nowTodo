export class StringBuilder {
  private value: string[];

  constructor() {
    this.value = [];
  }

  append(str: string | number | undefined | null): StringBuilder {
    this.value.push(String(str));
    return this;
  }

  appendNotNull(str: string | number | undefined | null): StringBuilder {
    if (str != null) {
      this.value.push(String(str));
    }
    return this;
  }

  build(separator?: string): string {
    return this.value.join(separator);
  }
}